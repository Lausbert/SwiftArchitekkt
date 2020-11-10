//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

class NodeBuilder {

    // MARK: - Internal -

    struct Result {
        let node: Node
        let warnings: [String]
    }

    static func generateNodeBuilderResult(for swiftCompilerResults: [SwiftCompilerWrapper.Result]) -> Result {
        // At first get all module root nodes and all named nodes which are also children of these root nodes. Named nodes which are also children of a root node are declared in this module.
        var warnings: [String] = []
        var moduleNodes: [Node] = []
        var nonChildNamedNodes: [UUID: Node] = [:]
        for swiftCompilerResult in swiftCompilerResults {
            do {
                let moduleNodeBuilderResult = try ModuleNodeBuilder(swiftCompilerResult: swiftCompilerResult).generateNode()
                nonChildNamedNodes.merge(moduleNodeBuilderResult.nonChildNamedNodes) { $1 }
                moduleNodes.append(moduleNodeBuilderResult.node)
            } catch { 
                warnings.append("")
            }
        }

        // At second initalize a general root node with module nodes as children
        let rootNode = Node(scope: "root")
        rootNode.set(children: moduleNodes)

        // At third link arcs with "unkown" scope (aka non child nodes) to the actual nodes in other modules, if they exist there
        var allNamedChildNodes: [String: Node] = [:]
        rootNode.allDescendants.forEach { node in
            if let name = node.name {
                allNamedChildNodes[name] = node
            }
        }
        rootNode.allDescendants.forEach { node in
            node.set(arcs: node.arcs.compactMap { arc in
                if let arcNode = nonChildNamedNodes[arc] {
                    if let name = arcNode.name, let namedNode = allNamedChildNodes[name] {
                        return namedNode.id
                    } else {
                        return nil
                    }
                } else {
                    return arc
                }
            })
        }
        return Result(node: rootNode, warnings: warnings)
    }

}
