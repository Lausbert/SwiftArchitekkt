//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt
import os

public class SwiftNodeRequestHandler: NodeRequestHandler {

    // MARK: - Public -

    public init() {}

    public var consistentUrlRequirements: [ConsistentUrlRequirement]? { return ConsistentUrlRequirementsEvaluator.consistentUrlRequirements }

    public var handableFileExtensions: [String] { return XcodeBuildWrapper.SwiftFileExtension.allCases.map { $0.rawValue } }

    public func handle(nodeRequest: NodeRequest, statusUpdateHandler: ((NodeRequest.StatusUpdate) -> Void)? = nil, completionHandler: @escaping (NodeRequest.Result) -> Void) {
        SwiftNodeRequestHandler.queue.async {

            let statusUpdateHandler = DispatchQueue.main.asyncClosure(statusUpdateHandler)
            let completionHandler = DispatchQueue.main.asyncClosure({ (result: NodeRequest.Result) -> Void in
                switch result {
                case let .failure(_, error):
                    let log = OSLog(subsystem: "org.cocoapods.SwiftArchitekkt", category: String(describing: self))
                    os_log("%@", log: log, type: .debug, error.localizedDescription)
                default:
                    break
                }
                completionHandler(result)
            })

            statusUpdateHandler(NodeRequest.StatusUpdate.willStartProcedure(nodeRequest, LastProcedure.evaluatingConsistentUrlRequirements.rawValue))
            guard let xcodeUrl = ConsistentUrlRequirementsEvaluator.getXcodeUrl(for: nodeRequest, completionHandler: completionHandler) else { return }
            statusUpdateHandler(NodeRequest.StatusUpdate.didFinishProcedure(nodeRequest, LastProcedure.evaluatingConsistentUrlRequirements.rawValue, nil))
            #if DEBUG
            if self.shouldStopAfter(procedure: LastProcedure.evaluatingConsistentUrlRequirements.rawValue, nodeRequest: nodeRequest) {
                return
            }
            #endif

            statusUpdateHandler(NodeRequest.StatusUpdate.willStartProcedure(nodeRequest, LastProcedure.updatingNodeRequest.rawValue))
            guard let updatedNodeRequest = XcodeBuildWrapper.update(nodeRequest: nodeRequest, xcodeUrl: xcodeUrl, completionHandler: completionHandler) else { return }
            statusUpdateHandler(NodeRequest.StatusUpdate.didFinishProcedure(updatedNodeRequest, LastProcedure.updatingNodeRequest.rawValue, nil))
            #if DEBUG
            if self.shouldStopAfter(procedure: LastProcedure.updatingNodeRequest.rawValue, nodeRequest: updatedNodeRequest) {
                return
            }
            #endif

            statusUpdateHandler(NodeRequest.StatusUpdate.willStartProcedure(updatedNodeRequest, LastProcedure.generatingCompileCommands.rawValue))
            guard let compileCommands = XcodeBuildWrapper.getCompileCommands(for: updatedNodeRequest, xcodeUrl: xcodeUrl, completionHandler: completionHandler) else { return }
            statusUpdateHandler(NodeRequest.StatusUpdate.didFinishProcedure(updatedNodeRequest, LastProcedure.generatingCompileCommands.rawValue, compileCommands.sorted(by: { $0.0 < $1.0 }).debugDescription))
            #if DEBUG
            if self.shouldStopAfter(procedure: LastProcedure.generatingCompileCommands.rawValue, nodeRequest: updatedNodeRequest) {
                return
            }
            #endif

            statusUpdateHandler(NodeRequest.StatusUpdate.willStartProcedure(updatedNodeRequest, LastProcedure.generatingAST.rawValue))
            guard let asts = SwiftCompilerWrapper.generateAsts(for: compileCommands, nodeRequest: updatedNodeRequest, xcodeUrl: xcodeUrl, completionHandler: completionHandler) else { return }
            statusUpdateHandler(NodeRequest.StatusUpdate.didFinishProcedure(updatedNodeRequest, LastProcedure.generatingAST.rawValue, asts.sorted(by: { $0.0 < $1.0 }).debugDescription))
            #if DEBUG
            if self.shouldStopAfter(procedure: LastProcedure.generatingAST.rawValue, nodeRequest: updatedNodeRequest) {
                return
            }
            #endif

            statusUpdateHandler(NodeRequest.StatusUpdate.willStartProcedure(updatedNodeRequest, LastProcedure.generatingNode.rawValue))
            guard let rootNode = NodeBuilder.generateNode(for: asts, nodeRequest: updatedNodeRequest, completionHandler: completionHandler) else { return }
            let encoder = JSONEncoder()
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            statusUpdateHandler(NodeRequest.StatusUpdate.didFinishProcedure(updatedNodeRequest, LastProcedure.generatingNode.rawValue, Optional(optionalData: try? encoder.encode(rootNode), encoding: String.Encoding.utf8) ?? nil))
            #if DEBUG
            if self.shouldStopAfter(procedure: LastProcedure.generatingNode.rawValue, nodeRequest: updatedNodeRequest) {
                return
            }
            #endif

            completionHandler(.success(updatedNodeRequest, rootNode))

        }
    }

    // MARK: - Internal -

    static let queue = DispatchQueue.global(qos: .utility)

    enum LastProcedure: String, CaseIterable {
        case evaluatingConsistentUrlRequirements = "Checking for Xcode url."
        case updatingNodeRequest = "Checking for missing parameters."
        case generatingCompileCommands = "Generating compile commands."
        case generatingAST = "Building abstract syntax tree."
        case generatingNode = "Building graph."
    }

    // MARK: - Private -

    #if DEBUG
    private func shouldStopAfter(procedure: String, nodeRequest: NodeRequest) -> Bool {
        if let stopAfter = nodeRequest.options[String(describing: LastProcedure.self)], stopAfter == procedure {
            return true
        } else {
            return false
        }
    }
    #endif

}
