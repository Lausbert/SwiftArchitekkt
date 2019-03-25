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

    enum ErrorEnum: LocalizedError, Equatable {

        case nonSourceFileScopeContainsSourceFileString(RawTokenizer.RawToken)
        case invalidToken(RawTokenizer.RawToken)

        var errorDescription: String? {
            switch self {
            case .nonSourceFileScopeContainsSourceFileString(let rawToken):
                return "Non source file scope contains source file string: \(rawToken)"
            case .invalidToken(let rawToken):
                return "Invalid token: \(rawToken)"
            }
        }

    }

    init(ast: String) {
        rawTokenizer = RawTokenizer(ast: ast)
    }

    func getNextToken() throws -> Token? {
        while let rawToken = nextRawToken() {
            // This switch statement prevents any handling of raw tokens within scopes that are not handled. Raw scope tokens should only be handled if there is just one or no unhandled left parenthesis token. All other raw tokens should only be handled if there is no unhandled left parenthesis token.
            switch rawToken {
            case .leftParenthesis, .rightParenthesis:
                break
            case .sourceFile,
                 .classDeclaration,
                 .funcDeclaration,
                 .varDeclaration:
                if unclosedLeftParenthesisCount > 1 {
                    continue
                } else {
                    break
                }
            default:
                if unclosedLeftParenthesisCount > 0 {
                    continue
                } else {
                    break
                }
            }

            // The actual handling of raw tokens.
            switch rawToken {
            case .sourceFile,
                 .classDeclaration,
                 .funcDeclaration,
                 .varDeclaration:
                return try scopeStartToken(with: rawToken)
            case .leftParenthesis:
                unclosedLeftParenthesisCount += 1
            case .rightParenthesis:
                if let scopeEnd = scopeEndToken() {
                    return scopeEnd
                } else {
                    continue
                }
            case .inherits:
                return inheritsToken()
            case .type:
                return try tokenWithIdentifier(for: rawToken)
            default:
                continue
            }
        }
        return nil
    }

    enum Token: CustomStringConvertible, Equatable {
        
        // token with identifier
        case type(String)

        // token with identifiers
        case inherits([String])

        // scope tokens
        case scopeStart(RawTokenizer.RawToken, identifier: String?)
        case scopeEnd(RawTokenizer.RawToken, identifier: String?)

        var description: String {
            switch self {
            case .scopeStart(let rawToken, let identifier):
                return identifier == nil ? "scopeStart: \(rawToken)" : "scopeStart: \(rawToken), \(identifier ?? "")"
            case .scopeEnd(let rawToken, let identifier):
                return identifier == nil ? "scopeEnd: \(rawToken)" : "scopeEnd: \(rawToken), \(identifier ?? "")"
            case .inherits(let identifiers):
                return "inherits: \(identifiers)"
            case .type(let identifier):
                return "type: \(identifier)"
            }
        }

    }

    // MARK: - Private -

    private var rawTokenizer: RawTokenizer
    private var pushedBackRawTokens: [RawTokenizer.RawToken] = []
    private var openScopes: [Token] = []
    private var unclosedLeftParenthesisCount = 0
    private var identifierPrefix: String {
        for openScope in openScopes.reversed() {
            if case let .scopeStart(rawToken, identifier) = openScope, rawToken != .sourceFile, let id = identifier {
                return id + "."
            }
        }
        return ""
    }

    private func nextRawToken() -> RawTokenizer.RawToken? {
        if let pushedBackRawToken = pushedBackRawTokens.first {
            pushedBackRawTokens.removeFirst()
            return pushedBackRawToken
        }
        return rawTokenizer.nextToken()
    }

    private func scopeStartToken(with rawToken: RawTokenizer.RawToken) throws -> Token {
        unclosedLeftParenthesisCount -= 1
        var pushedBackRawTokens: [RawTokenizer.RawToken] = []
        var scopeStart = Token.scopeStart(rawToken, identifier: nil)
        loop: while let nextRawToken = nextRawToken() {
            switch nextRawToken {
            case var .identifier(identifier):
                if rawToken == .sourceFile {
                    identifier = (identifier.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? "") + "SourceFile"
                } else if identifier.contains("SourceFile") {

                }
                scopeStart = Token.scopeStart(rawToken, identifier: identifierPrefix + identifier)
                break loop
            default:
                pushedBackRawTokens.append(nextRawToken)
                break loop
            }
        }
        self.pushedBackRawTokens += pushedBackRawTokens
        openScopes.append(scopeStart)
        return scopeStart
    }

    private func scopeEndToken() -> Token? {
        if unclosedLeftParenthesisCount > 0 {
            unclosedLeftParenthesisCount -= 1
            return nil
        }
        guard let scopeStart = openScopes.popLast(), case let .scopeStart(rawToken, identifier) = scopeStart else { return nil }
        return .scopeEnd(rawToken, identifier: identifier)
    }

    private func inheritsToken() -> Token {
        var identifiers: [String] = []
        loop: while let rawToken = nextRawToken() {
            switch rawToken {
            case .identifier(let identifier):
                identifiers.append(identifier)
            case .colon,
                 .comma:
                continue
            default:
                pushedBackRawTokens.append(rawToken)
                break loop
            }
        }
        return .inherits(identifiers)
    }

    private func tokenWithIdentifier(for initialRawToken: RawTokenizer.RawToken) throws -> Token {
        while let rawToken = nextRawToken() {
            switch rawToken {
            case let .identifier(identifier):
                switch initialRawToken {
                case .type:
                    return .type(identifier)
                default:
                    throw ErrorEnum.invalidToken(initialRawToken)
                }
            default:
                throw ErrorEnum.invalidToken(rawToken)
            }
        }
        throw ErrorEnum.invalidToken(initialRawToken)
    }

}
