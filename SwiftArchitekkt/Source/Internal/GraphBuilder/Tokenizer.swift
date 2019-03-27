//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

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

    enum Token: CustomStringConvertible, Equatable {

        // token with identifiers
        case type([String])
        case inherits([String])
        case tag(String)

        // scope tokens
        case scopeStart(String, identifier: String?)
        case scopeEnd(String, identifier: String?)

        // helper tokens
        case comma
        case nameIdentifier(String)
        case typeIdentifier(String)

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
            case .comma:
                return "comma"
            case let .nameIdentifier(identifier):
                return "nameIdentfier: \(identifier)"
            case let .typeIdentifier(identifier):
                return "typeIdentifier: \(identifier)"
            }
        }

    }

    init(ast: String) {
        iterator = ast.unicodeScalars.makeIterator()
    }

    func nextToken() -> Token? {
        if let pushedBackToken = pushedBackTokens.first {
            pushedBackTokens.removeFirst()
            return pushedBackToken
        }

        while let ch = nextScalar() {
            switch ch {
            case " ", "\n", "\\":
                continue
            case ",":
                return .comma
            case "(":
                return scopeStartToken()
            case ")":
                return scopeEndToken()
            case "[":
                return .tag(identifier(endingWith: "]"))
            case "<":
                return .tag(identifier(endingWith: ">"))
            case "\"":
                return .nameIdentifier(identifier(endingWith: "\""))
            case "'":
                return .typeIdentifier(identifier(endingWith: "'"))
            default:
                return keywordToken(startingWith: ch)
            }
        }
        return nil
    }

    // MARK: - Private -

    private var iterator: String.UnicodeScalarView.Iterator
    private var pushedBackScalar: UnicodeScalar?
    private var pushedBackTokens: [Token] = []
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
        if let next = pushedBackScalar {
            pushedBackScalar = nil
            return next
        }
        return iterator.next()
    }

    private func scopeStartToken() -> Token {
        var pushedBackTokens: [Token] = []
        guard let token = nextToken(), case let .tag(scope) = token else { fatalError("Unexpectedly could not find scope.") }
        var scopeStart = Token.scopeStart(scope, identifier: nil)
        loop: while let token = nextToken() {
            switch token {
            case var .nameIdentifier(identifier):
                if scope == "source_file" {
                    identifier = (identifier.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? "") + "SourceFile"
                }
                scopeStart = Token.scopeStart(scope, identifier: identifierPrefix + identifier)
                break loop
            case .scopeStart, .scopeEnd:
                pushedBackTokens.append(token)
                break loop
            default:
                pushedBackTokens.append(token)
                continue
            }
        }
        self.pushedBackTokens += pushedBackTokens
        openScopes.append(scopeStart)
        return scopeStart
    }

    private func scopeEndToken() -> Token {
        guard let scopeStart = openScopes.popLast(), case let .scopeStart(scope, identifier) = scopeStart else { fatalError("Unexpectedly reached scope end.") }
        return .scopeEnd(scope, identifier: identifier)
    }

    private func identifier(endingWith last: UnicodeScalar) -> String {
        var tokenText = ""

        while let ch = nextScalar() {
            switch ch {
            case last,
                 "\n":
                return tokenText
            default:
                tokenText.unicodeScalars.append(ch)
            }
        }
        return tokenText
    }

    private func keywordToken(startingWith first: UnicodeScalar) -> Token {
        var tokenText = String(first)

        var allowedRightParenthesis = 0
        var allowedRightBracket = 0

        loop: while let ch = nextScalar() {
            switch ch {
            case "\n",
                 "\"",
                 "'":
                pushedBackScalar = ch
                break loop
            case "(":
                allowedRightParenthesis += 1
                tokenText.unicodeScalars.append(ch)
            case ")":
                if allowedRightParenthesis <= 0 {
                    pushedBackScalar = ch
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
            case ",",
                 " ":
                if allowedRightParenthesis <= 0 && allowedRightBracket <= 0 {
                    pushedBackScalar = ch
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
            return typeToken()
        case "inherits:":
            return inheritsToken()
        default:
            return .tag(tokenText)
        }
    }

    private func typeToken() -> Token {
        if let token = nextToken(), case var .typeIdentifier(identifier) = token {
            identifier = identifier.components(separatedBy: CharacterSet(charactersIn: "()[]? ")).joined()
            identifier = identifier.replacingOccurrences(of: "->", with: ",")
            let identifiers = identifier.components(separatedBy: CharacterSet(charactersIn: ",:")).filter { !$0.isEmpty }
            return .type(identifiers)
        } else {
            return .type([])
        }
    }

    private func inheritsToken() -> Token {
        var identifiers: [String] = []
        var commaNeeded = false
        loop: while let token = nextToken() {
            switch token {
            case .tag(let identifier):
                if commaNeeded {
                    pushedBackTokens.append(token)
                    break loop
                } else {
                    identifiers.append(identifier)
                    commaNeeded = true
                }
            case .comma:
                commaNeeded = false
                continue
            default:
                pushedBackTokens.append(token)
                break loop
            }
        }
        return .inherits(identifiers)
    }

}
