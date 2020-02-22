//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt
import os

public class SwiftGraphRequestHandler: GraphRequestHandler {

    // MARK: - Public -

    public init() {}

    public var consistentUrlRequirements: [ConsistentUrlRequirement]? { return ConsistentUrlRequirementsEvaluator.consistentUrlRequirements }

    public var handableFileExtensions: [String] { return [XcodeBuildWrapper.SwiftFileExtension.project.rawValue] }; #warning("Todo")

    public func handle(graphRequest: GraphRequest, statusUpdateHandler: ((GraphRequest.StatusUpdate) -> Void)? = nil, completionHandler: @escaping (GraphRequest.Result) -> Void) {
        SwiftGraphRequestHandler.queue.async {

            let statusUpdateHandler = DispatchQueue.main.asyncClosure(statusUpdateHandler)
            let completionHandler = DispatchQueue.main.asyncClosure({ (result: GraphRequest.Result) -> Void in
                switch result {
                case let .failure(_, error):
                    let log = OSLog(subsystem: "org.cocoapods.SwiftArchitekkt", category: String(describing: self))
                    os_log("%@", log: log, type: .debug, error.localizedDescription)
                default:
                    break
                }
                completionHandler(result)
            })

            statusUpdateHandler(GraphRequest.StatusUpdate.willStartProcedure(graphRequest, LastProcedure.evaluatingConsistentUrlRequirements.rawValue))
            guard let xcodeUrl = ConsistentUrlRequirementsEvaluator.getXcodeUrl(for: graphRequest, completionHandler: completionHandler) else { return }
            statusUpdateHandler(GraphRequest.StatusUpdate.didFinishProcedure(graphRequest, LastProcedure.evaluatingConsistentUrlRequirements.rawValue, nil))
            #if DEBUG
            if self.shouldStopAfter(procedure: LastProcedure.evaluatingConsistentUrlRequirements.rawValue, graphRequest: graphRequest) {
                return
            }
            #endif

            statusUpdateHandler(GraphRequest.StatusUpdate.willStartProcedure(graphRequest, LastProcedure.updatingGraphRequest.rawValue))
            guard let updatedGraphRequest = XcodeBuildWrapper.update(graphRequest: graphRequest, xcodeUrl: xcodeUrl, completionHandler: completionHandler) else { return }
            statusUpdateHandler(GraphRequest.StatusUpdate.didFinishProcedure(updatedGraphRequest, LastProcedure.updatingGraphRequest.rawValue, nil))
            #if DEBUG
            if self.shouldStopAfter(procedure: LastProcedure.updatingGraphRequest.rawValue, graphRequest: updatedGraphRequest) {
                return
            }
            #endif

            statusUpdateHandler(GraphRequest.StatusUpdate.willStartProcedure(updatedGraphRequest, LastProcedure.generatingCompileCommands.rawValue))
            guard let compileCommands = XcodeBuildWrapper.getCompileCommands(for: updatedGraphRequest, xcodeUrl: xcodeUrl, completionHandler: completionHandler) else { return }
            #if DEBUG
            let sortedCompileCommands = compileCommands.sorted(by: { $0.0 < $1.0 })
            statusUpdateHandler(GraphRequest.StatusUpdate.didFinishProcedure(updatedGraphRequest, LastProcedure.generatingCompileCommands.rawValue, sortedCompileCommands.debugDescription))
            #else
            statusUpdateHandler(GraphRequest.StatusUpdate.didFinishProcedure(updatedGraphRequest, LastProcedure.generatingCompileCommands.rawValue, compileCommands.debugDescription))
            #endif
            #if DEBUG
            if self.shouldStopAfter(procedure: LastProcedure.generatingCompileCommands.rawValue, graphRequest: updatedGraphRequest) {
                return
            }
            #endif

//            statusUpdateHandler(GraphRequest.StatusUpdate.willStartProcedure(updatedGraphRequest, LastProcedure.generatingAST.rawValue))
//            guard let ast = SwiftCompilerWrapper.generateAst(for: compileCommands, graphRequest: updatedGraphRequest, xcodeUrl: xcodeUrl, completionHandler: completionHandler) else { return }
//            statusUpdateHandler(GraphRequest.StatusUpdate.didFinishProcedure(updatedGraphRequest, LastProcedure.generatingAST.rawValue, ast))
//            #if DEBUG
//            if self.shouldStopAfter(procedure: LastProcedure.generatingAST.rawValue, graphRequest: updatedGraphRequest) {
//                return
//            }
//            #endif
//
//            statusUpdateHandler(GraphRequest.StatusUpdate.willStartProcedure(updatedGraphRequest, LastProcedure.generatingGraph.rawValue))
//            guard let rootNode = GraphBuilder(ast: ast).generateGraph(graphRequest: updatedGraphRequest, completionHandler: completionHandler) else { return }
//            let encoder = JSONEncoder()
//            #if DEBUG
//            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
//            #endif
//            if let data = try? encoder.encode(rootNode) {
//                statusUpdateHandler(GraphRequest.StatusUpdate.didFinishProcedure(updatedGraphRequest, LastProcedure.generatingGraph.rawValue, String(data: data, encoding: String.Encoding.utf8)))
//            } else {
//                statusUpdateHandler(GraphRequest.StatusUpdate.didFinishProcedure(updatedGraphRequest, LastProcedure.generatingGraph.rawValue, nil))
//            }
//            #if DEBUG
//            if self.shouldStopAfter(procedure: LastProcedure.generatingGraph.rawValue, graphRequest: updatedGraphRequest) {
//                return
//            }
//            #endif
//
//            completionHandler(.success(updatedGraphRequest, rootNode))

        }
    }

    // MARK: - Internal -

    static let queue = DispatchQueue.global(qos: .utility)

    enum LastProcedure: String, CaseIterable {
        case evaluatingConsistentUrlRequirements
        case updatingGraphRequest
        case generatingCompileCommands
        case generatingAST
        case generatingGraph
    }

    // MARK: - Private -

    #if DEBUG
    private func shouldStopAfter(procedure: String, graphRequest: GraphRequest) -> Bool {
        if let stopAfter = graphRequest.options[String(describing: LastProcedure.self)], stopAfter == procedure {
            return true
        } else {
            return false
        }
    }
    #endif

}
