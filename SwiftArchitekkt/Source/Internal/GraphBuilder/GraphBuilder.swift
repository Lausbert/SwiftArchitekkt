//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt
import os

class GraphBuilder {

    // MARK: - Internal -

    init(ast: String) {
        tokenizer = Tokenizer(ast: ast)
    }

    func generateGraph(graphRequest: GraphRequest, completionHandler: (GraphRequest.Result) -> Void) -> Node? {
        do {
            while let token = tokenizer.nextToken() {
                switch token {
                case let .scopeStart(scope, identifier):
                    try handleScopeStart(scope: scope, identifier: identifier)
                case let .scopeEnd(scope, identifier):
                    handleScopeEnd(scope: scope, identifier: identifier)
                case let .type(identifiers),
                     let .inherits(identifiers):
                    handle(identifiers: identifiers)
                case let .tag(tag):
                    handle(tag: tag)
                default:
                    continue
                }
            }
            #if DEBUG
            let completeGraph = (graph + namedNodes.values.compactMap { $0.isChild ? nil : $0.node }).sorted()
            #else
            let completeGraph = graph + namedNodes.values.compactMap { $0.isChild ? nil : $0.node }
            #endif
            let rootNode = Node(scope: "root", isRoot: true)
            rootNode.set(children: completeGraph)
            return rootNode
        } catch {
            completionHandler(GraphRequest.Result.failure(graphRequest, error))
            return nil
        }
    }

    // MARK: - Private -

    private var tokenizer: Tokenizer
    private var openNodes: [Node] = []
    private var graph: [Node] = []
    private var namedNodes: [String: (node: Node, isChild: Bool)] = [:]

    private func getNamedNode(for identifier: String, scope: String = "unknown", willAddAsChild: Bool = false) -> Node {
        let node: Node
        if let existingNode = namedNodes[identifier]?.node {
            node = existingNode
            if scope != "unknown" {
                node.set(scope: scope)
            }
            if willAddAsChild {
                namedNodes[identifier] = (node: node, isChild: true)
            }
        } else {
            node = Node(identifier: identifier, scope: scope)
            namedNodes[identifier] = (node: node, isChild: willAddAsChild)
        }
        return node
    }
    
    private func handleScopeStart(scope: String, identifier: String?) throws {
        let node: Node
        if let identifier = identifier {
            node = getNamedNode(for: identifier, scope: scope, willAddAsChild: true)
        } else {
            node = Node(scope: scope)
        }
        if let lastOpenNode = openNodes.last {
            lastOpenNode.add(child: node)
        } else {
            graph.append(node)
        }
        openNodes.append(node)
    }

    private func handleScopeEnd(scope: String, identifier: String?) {
        assert(openNodes.last != nil)
        openNodes.removeLast()
    }

    private func handle(identifiers: [String]) {
        for identifier in identifiers {
            let node = getNamedNode(for: identifier)
            assert(openNodes.last != nil)
            openNodes.last?.add(arc: node)
        }
    }
    
    private func handle(tag: String) {
        guard tag.count <= 32 else { return }
        openNodes.last?.add(tag: tag)
    }

}
