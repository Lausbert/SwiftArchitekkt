//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation
import CoreArchitekkt

class Tokenizer {

    // MARK: - Internal -

    #if DEBUG
    static func debugDescription(of tokens: [Token]) {
        var indent = 0
        for token in tokens {
            switch token {
            case .scopeStart:
                print(String(repeating: "\t", count: indent) + "\(token)")
                indent += 1
            case .scopeEnd:
                indent -= 1
                print(String(repeating: "\t", count: indent) + "\(token)")
            default:
                print(String(repeating: "\t", count: indent) + "\(token)")
            }
        }
    }
    #endif
    
    enum ErrorEnum: LocalizedError, Equatable {
        case unexpectedlyReachedScopeEnd
        case unexpectlyFoundNoTypeIdentifier
        
        var errorDescription: String? {
            switch self {
            case .unexpectedlyReachedScopeEnd:
                return "Unexpectedly reached scope end."
            case .unexpectlyFoundNoTypeIdentifier:
                return "Unexpectly found no typeIdentifier."
            }
        }
    }

    enum Token: CustomStringConvertible, Equatable {

        // token with identifiers
        case type([String])
        case inherits([String])
        case tag(String)

        // scope tokens
        case scopeStart(String, identifier: String?)
        case scopeEnd(String, identifier: String?)

        var description: String {
            switch self {
            case let .scopeStart(scope, identifier):
                return identifier == nil ? "scopeStart: \(scope)" : "scopeStart: \(scope), \(identifier ?? "")"
            case let .scopeEnd(scope, identifier):
                return identifier == nil ? "scopeEnd: \(scope)" : "scopeEnd: \(scope), \(identifier ?? "")"
            case let .inherits(identifiers):
                return "inherits: \(identifiers)"
            case let .type(identifiers):
                return "type: \(identifiers)"
            case let .tag(identifier):
                return "tag: \(identifier)"
            }
        }

    }

    init(ast: String) {
        iterator = ast.unicodeScalars.makeIterator()
    }

    func nextToken() throws -> Token? {
        while let ch = nextScalar() {
            switch ch {
            case " ", "\n", "\\":
                continue
            case "(":
                return try scopeStartToken()
            case ")":
                return try scopeEndToken()
            case "'":
                return .tag(identifier(endingWith: "'"))
            case "[":
                return .tag(identifier(endingWith: "]", oneTimeExceptionForEvery: "["))
            case "<":
                return .tag(identifier(endingWith: ">"))
            default:
                return try keywordToken(startingWith: ch)
            }
        }
        return nil
    }

    // MARK: - Private -

    private var iterator: String.UnicodeScalarView.Iterator
    private var pushedBackScalars: [UnicodeScalar] = []
    private var openScopes: [Token] = []
    private var identifierPrefix: String {
        for openScope in openScopes.reversed() {
            if case let .scopeStart(scope, identifier) = openScope, scope != "source_file", let id = identifier {
                return id + "."
            }
        }
        return ""
    }

    private func nextScalar() -> UnicodeScalar? {
        if let next = pushedBackScalars.first {
            pushedBackScalars.removeFirst()
            return next
        }
        return iterator.next()
    }

    private func scopeStartToken() throws -> Token? {
        var scope: String = ""
        loop: while let ch = nextScalar() {
            switch ch {
            case " ", "\n", ")":
                pushedBackScalars.insert(ch, at: 0)
                break loop
            default:
                scope.unicodeScalars.append(ch)
            }
        }

        var pushedBackScalars: [UnicodeScalar] = []
        var id: String?
        loop: while let ch = nextScalar() {
            switch ch {
            case "\n":
                pushedBackScalars.append(ch)
                break loop
            case "\"":
                if pushedBackScalars.last == " " {
                    id = identifierPrefix + identifier(endingWith: "\"")
                    if scope == "source_file", let strongId = id {
                        id = (strongId.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? "") + "SourceFile"
                    }
                } else {
                    pushedBackScalars.append(ch)
                }
                break loop
            default:
                pushedBackScalars.append(ch)
            }
        }
        self.pushedBackScalars = pushedBackScalars + self.pushedBackScalars

        switch scope {
        case "if_config_decl": // just skip if_config_decl scope, since active branch will follow after anyway; related to swift compiler flags
            let scopeStart = Token.scopeStart(scope, identifier: id)
            openScopes.append(scopeStart)
            while let newToken = try nextToken() {
                if case let Token.scopeEnd(scope, identifier: _) = newToken, scope == "if_config_decl" {
                    return try nextToken()
                }
            }
            return nil
        case "extension_decl":
            id = identifierPrefix + "extension_decl." +  UUID().uuidString
        default:
            break
        }

        let scopeStart = Token.scopeStart(scope, identifier: id)
        openScopes.append(scopeStart)
        return scopeStart
    }

    private func scopeEndToken() throws -> Token {
        guard let scopeStart = openScopes.popLast(), case let .scopeStart(scope, identifier) = scopeStart else { throw ErrorEnum.unexpectedlyReachedScopeEnd }
        return .scopeEnd(scope, identifier: identifier)
    }

    private func keywordToken(startingWith first: UnicodeScalar) throws -> Token {
        var tokenText = String(first)

        var allowedRightParenthesis = 0
        var allowedRightBracket = 0
        var allowedRightArrow = 0

        loop: while let ch = nextScalar() {
            switch ch {
            case "(":
                allowedRightParenthesis += 1
                tokenText.unicodeScalars.append(ch)
            case ")":
                if allowedRightParenthesis <= 0 {
                    pushedBackScalars.insert(ch, at: 0)
                    break loop
                } else {
                    allowedRightParenthesis -= 1
                    tokenText.unicodeScalars.append(ch)
                }
            case "[":
                allowedRightBracket += 1
                tokenText.unicodeScalars.append(ch)
            case "]":
                allowedRightBracket -= 1
                tokenText.unicodeScalars.append(ch)
            case "<":
                allowedRightArrow += 1
                tokenText.unicodeScalars.append(ch)
            case ">":
                allowedRightArrow -= 1
                tokenText.unicodeScalars.append(ch)
            case "\n",
                 "\"",
                 "'",
                 ",",
                 " ":
                if allowedRightParenthesis <= 0 && allowedRightBracket <= 0 && allowedRightArrow <= 0 {
                    pushedBackScalars.insert(ch, at: 0)
                    break loop
                } else {
                    tokenText.unicodeScalars.append(ch)
                }
            default:
                tokenText.unicodeScalars.append(ch)
            }
        }

        assert(allowedRightParenthesis == 0)
        assert(allowedRightBracket == 0)

        switch tokenText {
        case "type=":
            return try typeToken()
        case "inherits:":
            return inheritsToken()
        case "value=":
            if nextScalar() == "\"" {
                let value = identifier(endingWith: "\"")
                return .tag(tokenText + value)
            } else {
                return .tag(tokenText)
            }
        default:
            if let scopeStart = openScopes.last, case let .scopeStart(scope, identifier: _) = scopeStart, scope == "extension_decl", !tokenText.contains("=") {
                return .type(typeIdentifiers(forTypeIdentifier: tokenText))
            } else {
                return .tag(tokenText)
            }
        }
    }

    private func typeToken() throws -> Token {
        var ch = nextScalar()
        if ch == "\n" {
            ch = nextScalar()
        }
        guard ch == "'" else { throw ErrorEnum.unexpectlyFoundNoTypeIdentifier }
        let id = identifier(endingWith: "'")
        return .type(typeIdentifiers(forTypeIdentifier: id))
    }

    private func inheritsToken() -> Token {
        let id = identifier(endingWith: "\n", pushBackLast: ")")
        let identifiers = id.replacingOccurrences(of: " ", with: "").components(separatedBy: [",", "&"])
        return .inherits(identifiers)
    }

    private func identifier(endingWith last: UnicodeScalar, oneTimeExceptionForEvery first: UnicodeScalar? = nil, pushBackLast: UnicodeScalar? = nil) -> String {
        var tokenText = ""
        var allowedLast = 0

        while let ch = nextScalar() {
            switch ch {
            case first:
                allowedLast += 1
            case last:
                if allowedLast <= 0 {
                    return tokenText.replacingOccurrences(of: "\n", with: "")
                } else {
                    allowedLast -= 1
                    tokenText.unicodeScalars.append(ch)
                }
            case pushBackLast:
                pushedBackScalars.insert(ch, at: 0)
                return tokenText.replacingOccurrences(of: "\n", with: "")
            default:
                tokenText.unicodeScalars.append(ch)
            }
        }
        return tokenText.replacingOccurrences(of: "\n", with: "")
    }

    private func typeIdentifiers(forTypeIdentifier id: String) -> [String] {
        let id = moveGenericParametersToTheEnd(inTypeIdentifier: id)
        let identifiers = id.replacingOccurrences(of: "?", with: "")
            .replacingOccurrences(of: "[\\[\\]()<>,-]", with: " ", options: .regularExpression)
            .components(separatedBy: " ")
            .uniqued()
            .filter { !$0.isEmpty && !["inout", "where", "throws", "Self", "block", "__owned", "__shared", "=="].contains($0) && ![":"].contains($0.last) && !["@"].contains($0.first)}
        return identifiers
    }

    private func moveGenericParametersToTheEnd(inTypeIdentifier id: String) -> String {
        var id = id.replacingOccurrences(of: "->", with: " ")
        while true {
            guard let match = Regex.getMatches(for: StaticString(stringLiteral: "<[^<]+?>"), text: id).first, let range = Range(match.range, in: id) else { break }
            let genericIdentifier = String(id[id.index(after: range.lowerBound)..<id.index(before: range.upperBound)])
            let idBefore = id[..<range.lowerBound]
            let idAfter = String(id[range.upperBound...])
            id = idBefore + idAfter + " " + genericIdentifier
        }
        return id
    }
}
