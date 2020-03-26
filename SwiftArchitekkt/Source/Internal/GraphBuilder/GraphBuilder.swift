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
            
            // At first get all module root nodes and all named nodes which are also children of these root nodes. Named nodes which are also children of a root node are declared in this module.
            var moduleNodes: [Node] = []
            var childNamedNodes: [String: Node] = [:]
            for ast in asts {
                let (moduleNode, moduleChildNamedNodes) = try ModuleGraphBuilder(ast: ast).generateGraph()
                childNamedNodes.merge(moduleChildNamedNodes) { $1 }
                moduleNodes.append(moduleNode)
            }
            
            // At second initalize a general root node with module nodes as children
            let rootNode = Node(scope: "root", isRoot: true)
            rootNode.set(children: moduleNodes)
            
            // At third traverse all arcs in whole graph with unknown scope. Unknown scope means they were referenced but not declared in a module. Check if another module contains a node with the same identifier. If this is the case replace the arc with the node from another module. If no other module contains a node with the same identifier, remove the arc. This should be the case for builtin types, stuff declared in system libraries and Metatypes, since they do not show in the asts.
            rootNode.allDescendants.forEach { node in
                var arcsWithKnownScope: [Node] = []
                for arc in node.arcs {
                    if arc.scope == "unknown",
                        let id = arc.identifier,
                        let arcWithKnownScope = childNamedNodes[id] {
                        arcsWithKnownScope.append(arcWithKnownScope)
                    } else if arc.scope != "unknown" {
                        arcsWithKnownScope.append(arc)
                    }
                }
                node.set(arcs: arcsWithKnownScope)
            }
            
            return rootNode

        } catch {
            completionHandler(GraphRequest.Result.failure(graphRequest, error))
            return nil
        }
    }

}
