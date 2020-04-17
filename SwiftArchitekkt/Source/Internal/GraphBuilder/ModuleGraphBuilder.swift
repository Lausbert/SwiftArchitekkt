//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

class ModuleGraphBuilder {

    // MARK: - Internal -

    typealias ModuleName = String
    typealias Ast = String
    typealias NonChildNamedNode = Node

    init(ast: (ModuleName, Ast)) {
        moduleName = ast.0
        tokenizer = Tokenizer(ast: ast.1)
    }

    func generateGraph() throws -> (Node, [UUID: NonChildNamedNode]) {
        while let token = try tokenizer.nextToken() {
            switch token {
            case let .scopeStart(scope, name):
                try handleScopeStart(scope: scope, name: name)
            case let .scopeEnd(scope, name):
                handleScopeEnd(scope: scope, name: name)
            case let .type(names),
                 let .inherits(names):
                handle(names: names)
            case let .tag(tag):
                handle(tag: tag)
            }
        }
        let moduleNode = Node(scope: "module", name: moduleName)
        moduleNode.set(children: graph)
        return (moduleNode, getNonChildNamedNodes())
    }

    // MARK: - Private -

    private let moduleName: ModuleName
    private let tokenizer: Tokenizer

    private var openNodes: [Node] = []
    private var graph: [Node] = []
    private var childNodes: Set<String> = [] // track which nodes are already children
    private var namedNodes: [String: Node] = [:]

    private func getNonChildNamedNodes() -> [UUID: NonChildNamedNode] {
        Dictionary(uniqueKeysWithValues: namedNodes.values.compactMap({ childNodes.contains($0.name ?? "") ? nil : ($0.id, $0) }))
    }

    private func handleScopeStart(scope: String, name: String?) throws {
        let node: Node
        if let name = name {
            if childNodes.contains(name) {
                if let namedNode = namedNodes[name], let oldId = namedNode.name {
                    namedNodes.removeValue(forKey: name)
                    namedNode.set(name: oldId + ":" + UUID().uuidString)
                }
                node = Node(scope: scope, name: name + ":" + UUID().uuidString)
            } else {
                childNodes.insert(name)
                if let namedNode = namedNodes[name] {
                    namedNode.set(scope: scope)
                    node = namedNode
                } else {
                    node = Node(scope: scope, name: name)
                    namedNodes[name] = node
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

    private func handleScopeEnd(scope: String, name: String?) {
        if let na = openNodes.last?.name {
            if let name = name {
                assert(na.contains(name))
            } else {
                assertionFailure()
            }
        }
        assert(openNodes.last != nil && openNodes.last?.scope == scope)
        openNodes.removeLast()
    }

    private func handle(names: [String]) {
        for name in names {
            let node: Node
            if let namedNode = namedNodes[name] {
                node = namedNode
            } else {
                node = Node(scope: "unknown", name: name)
                namedNodes[name] = node
            }
            assert(openNodes.last != nil)
            openNodes.last?.add(arc: node.id)
        }
    }

    private func handle(tag: String) {
        guard tag.count <= 32, ["range=", "decl=", "override=", "anonname=", "location="].allSatisfy({ !tag.contains($0) }) else { return }
        openNodes.last?.add(tag: tag)
    }

}
