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

    func nextToken() -> Token? {
        while let ch = nextScalar() {
            switch ch {
            case " ", "\n", "\\":
                continue
            case "(":
                return scopeStartToken()
            case ")":
                return scopeEndToken()
            case "'":
                return .tag(identifier(endingWith: "'"))
            case "[":
                return .tag(identifier(endingWith: "]"))
            case "<":
                return .tag(identifier(endingWith: ">"))
            default:
                return keywordToken(startingWith: ch)
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

    private func scopeStartToken() -> Token {
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
            case  "\n":
                pushedBackScalars.append(ch)
                break loop
            case "\"":
                id = identifierPrefix + identifier(endingWith: "\"")
                if scope == "source_file", let strongId = id {
                    id = (strongId.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? "") + "SourceFile"
                }
                break loop
            default:
                pushedBackScalars.append(ch)
            }
        }
        self.pushedBackScalars = pushedBackScalars + self.pushedBackScalars
        
        let scopeStart = Token.scopeStart(scope, identifier: id)
        openScopes.append(scopeStart)
        return scopeStart
    }

    private func scopeEndToken() -> Token {
        guard let scopeStart = openScopes.popLast(), case let .scopeStart(scope, identifier) = scopeStart else { fatalError("Unexpectedly reached scope end.") }
        return .scopeEnd(scope, identifier: identifier)
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
                pushedBackScalars.insert(ch, at: 0)
                break loop
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
            case ",",
                 " ":
                if allowedRightParenthesis <= 0 && allowedRightBracket <= 0 {
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
            return typeToken()
        case "inherits:":
            return inheritsToken()
        default:
            return .tag(tokenText)
        }
    }

    private func typeToken() -> Token {
        guard nextScalar() == "'" else { fatalError("Unexpectly found no typeIdentifier.") }
        let id = identifier(endingWith: "'")
        let identifiers = id.replacingOccurrences(of: "?", with: "")
            // I know, I know, the following two lines should be included in the regular expression. But I did not get it to work.
                            .replacingOccurrences(of: "[", with: " ")
                            .replacingOccurrences(of: "]", with: " ")
                            .replacingOccurrences(of: "[()<>,-]", with: " ", options: .regularExpression)
                            .components(separatedBy: " ")
                            .filter { !$0.isEmpty && $0 != "inout" && ![":"].contains($0.last) && !["@"].contains($0.first)}
        return .type(identifiers)
    }

    private func inheritsToken() -> Token {
        let id = identifier(endingWith: "\n")
        let identifiers = id.replacingOccurrences(of: " ", with: "").components(separatedBy: ",")
        return .inherits(identifiers)
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

}
