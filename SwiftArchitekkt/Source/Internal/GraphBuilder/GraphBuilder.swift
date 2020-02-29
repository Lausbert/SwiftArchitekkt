//
//  GraphBuilder.swift
//  SwiftArchitekkt
//
//  Created by Stephan Lerner on 29.02.20.
//

import Foundation
import CoreArchitekkt

class GraphBuilder {
    
    // MARK: - Internal -
    
    typealias ModuleName = String
    typealias Ast = String
    
    static func generateGraph(for asts: [(ModuleName, Ast)], graphRequest: GraphRequest, completionHandler: (GraphRequest.Result) -> Void) -> Node? {
        do {
            var moduleNodes: [Node] = []
            for ast in asts {
                let moduleNode = try ModuleGraphBuilder(ast: ast).generateGraph()
                moduleNodes.append(moduleNode)
            }
            let rootNode = Node(scope: "root", isRoot: true)
            rootNode.set(children: moduleNodes)
            return rootNode

        } catch {
            completionHandler(GraphRequest.Result.failure(graphRequest, error))
            return nil
        }
    }

    // MARK: - Private -
    
    
    
}
