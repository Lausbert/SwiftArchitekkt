//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt
import os

class GraphBuilder {

    // MARK: - Internal -

    enum ErrorEnum: LocalizedError, Equatable {
        case unexpectedScopeEnd(RawTokenizer.RawToken, identifier: String?)
        case unexpectedNewSourceFile
        case unexpectedUnnamedSourceFile
        case uncontainedNonSourceFileScope
        case missingIdentifier(RawTokenizer.RawToken)
        case invalidToken(RawTokenizer.RawToken)

        var errorDescription: String? {
            switch self {
            case let .unexpectedScopeEnd(rawToken, identifier):
                return identifier == nil ? "Unexpected scope end: \(rawToken)" : "Unexpected scope end: \(rawToken), \(identifier ?? "")"
            case .unexpectedNewSourceFile:
                return "Unexpected new source file."
            case .unexpectedUnnamedSourceFile:
                return "Unexpected unnamed source file"
            case .uncontainedNonSourceFileScope:
                return "Uncontained non source file scope."
            case let .missingIdentifier(rawToken):
                return "Missing identifier: \(rawToken)"
            case let .invalidToken(rawToken):
                return "Invalid token: \(rawToken)"
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
                case let .scopeStart(rawToken, identifier):
                    try handleScopeStart(rawToken: rawToken, identifier: identifier)
                case let .scopeEnd(rawToken, identifier):
                    try handleScopeEnd(rawToken: rawToken, identifier: identifier)
                case .type(let identifiers),
                     .inherits(let identifiers):
                    try handle(identifiers: identifiers)
                }
            }
            addNamedNodesAsChildIfPossible()
            #if DEBUG
            let completeGraph = (graph + namedNodes.values.compactMap { $0.isChild ? nil : $0.node }).sorted()
            #else
            let completeGraph = graph + namedNodes.values.compactMap { $0.isChild ? nil : $0.node }
            #endif
            let rootNode = Node(scope: Scope.root.rawValue, isRoot: true)
            rootNode.set(children: completeGraph)
            return rootNode
        } catch {
            completionHandler(GraphRequest.Result.failure(graphRequest, error))
            return nil
        }
    }

    // MARK: - Private -

    private enum Scope: String {
        case root
        case unknown
        case sourceFile
        case `class`
        case function
        case variable
    }

    private var tokenizer: Tokenizer
    private var openNodes: [Node] = []
    private var graph: [Node] = []
    private var namedNodes: [String: (node: Node, isChild: Bool)] = [:]

    private func getLastOpenNode() throws -> Node {
        guard let lastOpenNode = openNodes.last else { throw ErrorEnum.uncontainedNonSourceFileScope }
        return lastOpenNode
    }

    private func getNamedNode(for identifier: String, willAddAsChild: Bool = false) -> Node {
        let node: Node
        if let existingNode = namedNodes[identifier]?.node {
            node = existingNode
            if willAddAsChild {
                namedNodes[identifier] = (node: node, isChild: true)
            }
        } else {
            node = Node(identifier: identifier, scope: Scope.unknown.rawValue)
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

    private func handleScopeStart(rawToken: RawTokenizer.RawToken, identifier: String?) throws {
        switch rawToken {
        case .sourceFile:
            guard openNodes.isEmpty else { throw ErrorEnum.unexpectedNewSourceFile }
            guard let identifier = identifier else { throw ErrorEnum.unexpectedUnnamedSourceFile }
            let node = Node(identifier: identifier, scope: Scope.sourceFile.rawValue)
            openNodes.append(node)
            graph.append(node)
        case .classDeclaration, .funcDeclaration, .varDeclaration:
            try handleNamedScopeStart(rawToken: rawToken, identifier: identifier)
        default:
            innerLoop: while let newToken = try tokenizer.getNextToken() {
                switch newToken {
                case let .scopeEnd(newRawToken, identifier: newIdentifier):
                    if newRawToken == rawToken && newIdentifier == identifier {
                        break innerLoop
                    } else {
                        continue
                    }
                default:
                    continue
                }
            }
        }
    }

    private func handleScopeEnd(rawToken: RawTokenizer.RawToken, identifier: String?) throws {
        guard !openNodes.isEmpty else { throw ErrorEnum.unexpectedScopeEnd(rawToken, identifier: identifier) }
        openNodes.removeLast()
    }

    private func handleNamedScopeStart(rawToken: RawTokenizer.RawToken, identifier: String?) throws {
        assert(identifier != nil)
        guard let identifier = identifier else { throw ErrorEnum.missingIdentifier(rawToken) }

        let scope: Scope
        switch rawToken {
        case .classDeclaration:
            scope = .class
        case .funcDeclaration:
            scope = .function
        case .varDeclaration:
            scope = .variable
        default:
            throw ErrorEnum.invalidToken(rawToken)
        }

        let node = getNamedNode(for: identifier, willAddAsChild: true)
        node.set(scope: scope.rawValue)
        try getLastOpenNode().add(child: node)
        openNodes.append(node)
    }

    private func handle(identifiers: [String]) throws {
        for identifier in identifiers {
            let node = getNamedNode(for: identifier)
            try getLastOpenNode().add(arc: node)
        }
    }

}
