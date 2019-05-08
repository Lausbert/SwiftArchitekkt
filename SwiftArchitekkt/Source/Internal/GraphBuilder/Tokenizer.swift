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
                return .tag(identifier(endingWith: "]", oneTimeExceptionForEvery: "["))
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

    private func scopeStartToken() -> Token? {
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
            while let newToken = nextToken() {
                if case let Token.scopeEnd(scope, identifier: _) = newToken, scope == "if_config_decl" {
                    return nextToken()
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

    private func scopeEndToken() -> Token {
        guard let scopeStart = openScopes.popLast(), case let .scopeStart(scope, identifier) = scopeStart else { fatalError("Unexpectedly reached scope end.") }
        return .scopeEnd(scope, identifier: identifier)
    }

    private func keywordToken(startingWith first: UnicodeScalar) -> Token {
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
            return typeToken()
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
            return .tag(tokenText)
        }
    }

    private func typeToken() -> Token {
        var ch = nextScalar()
        if ch == "\n" {
            ch = nextScalar()
        }
        guard ch == "'" else { fatalError("Unexpectly found no typeIdentifier.") }
        let id = identifier(endingWith: "'")
        let identifiers = id.replacingOccurrences(of: "?", with: "")
            // I know, I know, the following two lines should be included in the regular expression. But I did not get it to work.
                            .replacingOccurrences(of: "[", with: " ")
                            .replacingOccurrences(of: "]", with: " ")
                            .replacingOccurrences(of: "[()<>,-]", with: " ", options: .regularExpression)
                            .components(separatedBy: " ")
                            .filter { !$0.isEmpty && !["inout", "where", "throws", "Self", "block", "__owned", "__shared"].contains($0) && ![":"].contains($0.last) && !["@"].contains($0.first)}
        return .type(identifiers)
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

}
