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
            while let token = try tokenizer.nextToken() {
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
                }
            }
            #if DEBUG
            let completeGraph = (graph + getNonChildNamedNodes()).sorted()
            #else
            let completeGraph = graph + getNonChildNamedNodes()
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
    private var childNodes: Set<String> = [] // track which nodes are already children
    private var namedNodes: [String: Node] = [:]

    private func getNonChildNamedNodes() -> [Node] {
        return namedNodes.values.compactMap { (node) -> Node? in
            guard let identifier = node.identifier else { return nil }
            if !childNodes.contains(identifier) {
                return node
            }
            return nil
        }
    }

    private func handleScopeStart(scope: String, identifier: String?) throws {
        let node: Node
        if let identifier = identifier {
            if childNodes.contains(identifier) {
                if let namedNode = namedNodes[identifier], let oldId = namedNode.identifier {
                    namedNodes.removeValue(forKey: identifier)
                    namedNode.set(identifier: oldId + ":" + UUID().uuidString)
                }
                node = Node(identifier: identifier + ":" + UUID().uuidString, scope: scope)
            } else {
                childNodes.insert(identifier)
                if let namedNode = namedNodes[identifier] {
                    namedNode.set(scope: scope)
                    node = namedNode
                } else {
                    node = Node(identifier: identifier, scope: scope)
                    namedNodes[identifier] = node
                }
            }
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
        if let id = openNodes.last?.identifier {
            if let identifier = identifier {
                assert(id.contains(identifier))
            } else {
                assertionFailure()
            }
        }
        assert(openNodes.last != nil && openNodes.last?.scope == scope)
        openNodes.removeLast()
    }

    private func handle(identifiers: [String]) {
        for identifier in identifiers {
            let node: Node
            if let namedNode = namedNodes[identifier] {
                node = namedNode
            } else {
                node = Node(identifier: identifier, scope: "unknown")
                namedNodes[identifier] = node
            }
            assert(openNodes.last != nil)
            openNodes.last?.add(arc: node)
        }
    }

    private func handle(tag: String) {
        guard tag.count <= 32, ["range=", "decl=", "override=", "anonname="].allSatisfy({ !tag.contains($0) }) else { return }
        openNodes.last?.add(tag: tag)
    }

}
