//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt
import os

public class SwiftGraphRequestHandler: GraphRequestHandler {

    // MARK: - Public -

    public init() {}

    public var accessRequirements: [AccessRequirement]? { return AccessRequirementsEvaluator.accessRequirements }

    public var handableFileExtensions: [String] { return XcodeBuildWrapper.SwiftFileExtension.allCases.map { $0.rawValue } }

    public func handle(graphRequest: GraphRequest, statusUpdateHandler: ((GraphRequest.StatusUpdate) -> Void)? = nil, completionHandler: @escaping (GraphRequest.Result) -> Void) {
        SwiftGraphRequestHandler.queue.async {

            let statusUpdateHandler = DispatchQueue.main.asyncClosure(statusUpdateHandler)
            let completionHandler = DispatchQueue.main.asyncClosure({ (result: GraphRequest.Result) -> Void in
                switch result {
                case let .failure(graphRequest, error):
                    AccessRequirementsEvaluator.stopAccessFor(graphRequest: graphRequest)
                    let log = OSLog(subsystem: "org.cocoapods.SwiftArchitekkt", category: String(describing: self))
                    os_log("%@", log: log, type: .debug, error.localizedDescription)
                case let .decisionNeeded(graphRequest, _), let .success(graphRequest, _):
                    AccessRequirementsEvaluator.stopAccessFor(graphRequest: graphRequest)
                }
                completionHandler(result)
            })

            statusUpdateHandler(GraphRequest.StatusUpdate.willStartProcedure(graphRequest, LastProcedure.evaluatingAccessRequirements.rawValue))
            guard AccessRequirementsEvaluator.evaluateAndStartAccessFor(graphRequest: graphRequest, completionHandler: completionHandler) else { return }
            statusUpdateHandler(GraphRequest.StatusUpdate.didFinishProcedure(graphRequest, LastProcedure.evaluatingAccessRequirements.rawValue, nil))
            #if DEBUG
            if self.shouldStopAfter(procedure: LastProcedure.evaluatingAccessRequirements.rawValue, graphRequest: graphRequest) {
                return
            }
            #endif

            statusUpdateHandler(GraphRequest.StatusUpdate.willStartProcedure(graphRequest, LastProcedure.updatingGraphRequest.rawValue))
            guard let updatedGraphRequest = XcodeBuildWrapper.update(graphRequest: graphRequest, completionHandler: completionHandler) else { return }
            statusUpdateHandler(GraphRequest.StatusUpdate.didFinishProcedure(updatedGraphRequest, LastProcedure.updatingGraphRequest.rawValue, nil))
            #if DEBUG
            if self.shouldStopAfter(procedure: LastProcedure.updatingGraphRequest.rawValue, graphRequest: updatedGraphRequest) {
                return
            }
            #endif

            statusUpdateHandler(GraphRequest.StatusUpdate.willStartProcedure(updatedGraphRequest, LastProcedure.generatingCompileCommands.rawValue))
            guard let compileCommands = XcodeBuildWrapper.getCompileCommands(for: updatedGraphRequest, completionHandler: completionHandler) else { return }
            statusUpdateHandler(GraphRequest.StatusUpdate.didFinishProcedure(updatedGraphRequest, LastProcedure.generatingCompileCommands.rawValue, compileCommands.joined(separator: " ")))
            #if DEBUG
            if self.shouldStopAfter(procedure: LastProcedure.generatingCompileCommands.rawValue, graphRequest: updatedGraphRequest) {
                return
            }
            #endif

            statusUpdateHandler(GraphRequest.StatusUpdate.willStartProcedure(updatedGraphRequest, LastProcedure.generatingAST.rawValue))
            guard let ast = SwiftCompilerWrapper.generateAst(for: compileCommands, graphRequest: updatedGraphRequest, completionHandler: completionHandler) else { return }
            statusUpdateHandler(GraphRequest.StatusUpdate.didFinishProcedure(updatedGraphRequest, LastProcedure.generatingAST.rawValue, ast))
            #if DEBUG
            if self.shouldStopAfter(procedure: LastProcedure.generatingAST.rawValue, graphRequest: updatedGraphRequest) {
                return
            }
            #endif

            AccessRequirementsEvaluator.stopAccessFor(graphRequest: updatedGraphRequest)

            statusUpdateHandler(GraphRequest.StatusUpdate.willStartProcedure(updatedGraphRequest, LastProcedure.generatingGraph.rawValue))
            let encoder = JSONEncoder()
            guard let rootNode = GraphBuilder(ast: ast).generateGraph(graphRequest: updatedGraphRequest, completionHandler: completionHandler) else { return }
            #if DEBUG
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            #endif
            if let data = try? encoder.encode(rootNode) {
                statusUpdateHandler(GraphRequest.StatusUpdate.didFinishProcedure(updatedGraphRequest, LastProcedure.generatingGraph.rawValue, String(data: data, encoding: String.Encoding.utf8)))
            } else {
                statusUpdateHandler(GraphRequest.StatusUpdate.didFinishProcedure(updatedGraphRequest, LastProcedure.generatingGraph.rawValue, nil))
            }
            #if DEBUG
            if self.shouldStopAfter(procedure: LastProcedure.generatingGraph.rawValue, graphRequest: updatedGraphRequest) {
                return
            }
            #endif

            completionHandler(.success(updatedGraphRequest, rootNode))

        }
    }

    // MARK: - Internal -

    static let queue = DispatchQueue.global(qos: .utility)

    enum LastProcedure: String, CaseIterable {
        case evaluatingAccessRequirements
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
