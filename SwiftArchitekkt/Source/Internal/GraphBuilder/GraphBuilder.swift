//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt
import os

class GraphBuilder {

    // MARK: - Internal -

    enum ErrorEnum: LocalizedError, Equatable {
        case missingIdentifier(String)

        var errorDescription: String? {
            switch self {
            case let .missingIdentifier(scope):
                return "Missing identifier: \(scope)"
            }
        }
    }

    init(ast: String) {
        tokenizer = Tokenizer(ast: ast)
    }

    func generateGraph(graphRequest: GraphRequest, completionHandler: (GraphRequest.Result) -> Void) -> Node? {
        do {
            while let token = try tokenizer.getNextToken() {
                switch token {
                case let .scopeStart(scope, identifier):
                    try handleScopeStart(scope: scope, identifier: identifier)
                case let .scopeEnd(scope, identifier):
                    handleScopeEnd(scope: scope, identifier: identifier)
                case .type(let identifiers),
                     .inherits(let identifiers):
                    handle(identifiers: identifiers)
                }
            }
            addNamedNodesAsChildIfPossible()
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

    private func getNamedNode(for identifier: String, willAddAsChild: Bool = false) -> Node {
        let node: Node
        if let existingNode = namedNodes[identifier]?.node {
            node = existingNode
            if willAddAsChild {
                namedNodes[identifier] = (node: node, isChild: true)
            }
        } else {
            node = Node(identifier: identifier, scope: "unknown")
            namedNodes[identifier] = (node: node, isChild: willAddAsChild)
        }
        return node
    }

    private func addNamedNodesAsChildIfPossible() {
        for (identifier, tuple) in namedNodes {
            guard !tuple.isChild else { continue }
            let parentIdentifier = identifier.components(separatedBy: ".").dropLast().joined(separator: ".")
            guard !parentIdentifier.isEmpty else { continue }
            if let parentNode = namedNodes[parentIdentifier]?.node {
                namedNodes[identifier] = (node: tuple.node, isChild: true)
                parentNode.add(child: tuple.node)
            }
        }
    }
    
    private func handleScopeStart(scope: String, identifier: String?) throws {
        guard let identifier = identifier else { throw ErrorEnum.missingIdentifier(scope) }
        
        let node = getNamedNode(for: identifier, willAddAsChild: true)
        node.set(scope: scope)
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

}
