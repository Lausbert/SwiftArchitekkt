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
                 .importDeclaration,
                 .classDeclaration,
                 .funcDeclaration,
                 .varDeclaration,
                 .accessorDeclaration,
                 .parameterList,
                 .parameter,
                 .constructorDeclaration,
                 .destructorDeclaration,
                 .braceStatement,
                 .callExpression,
                 .dotSyntaxCallExpression,
                 .declarationReferenceExpression,
                 .superReferenceExpression,
                 .tupleExpression,
                 .rebindSelfInConstructorExpression,
                 .otherConstructorReferenceExpression,
                 .returnStatement,
                 .patternBindingDeclaration,
                 .patternTyped,
                 .patternNamed,
                 .typeExpression,
                 .loadExpression,
                 .memberReferenceExpression,
                 .constructorReferenceCallExpression,
                 .result,
                 .typeId,
                 .component,
                 .assignExpression:
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
                 .importDeclaration,
                 .classDeclaration,
                 .funcDeclaration,
                 .varDeclaration,
                 .accessorDeclaration,
                 .parameterList,
                 .parameter,
                 .constructorDeclaration,
                 .destructorDeclaration,
                 .braceStatement,
                 .callExpression,
                 .dotSyntaxCallExpression,
                 .declarationReferenceExpression,
                 .superReferenceExpression,
                 .tupleExpression,
                 .rebindSelfInConstructorExpression,
                 .otherConstructorReferenceExpression,
                 .returnStatement,
                 .patternBindingDeclaration,
                 .patternTyped,
                 .patternNamed,
                 .typeExpression,
                 .loadExpression,
                 .memberReferenceExpression,
                 .constructorReferenceCallExpression,
                 .result,
                 .typeId,
                 .component,
                 .assignExpression:
                return try scopeStartToken(with: rawToken)
            case .leftParenthesis:
                unclosedLeftParenthesisCount += 1
            case .rightParenthesis:
                if let scopeEnd = scopeEndToken() {
                    return scopeEnd
                } else {
                    continue
                }
            case .implicit:
                return .implicit
            case .interface:
                return .interface
            case .superReference:
                return .superReference
            case .objc:
                return .objc
            case .nonResilient:
                return .nonResilient
            case .dynamic:
                return .dynamic
            case .noThrow:
                return .noThrow
            case .designated:
                return .designated
            case .required:
                return .required
            case .directToStorage:
                return .directToStorage
            case .inOut:
                return .inOut
            case .inherits:
                return inheritsToken()
            case .type,
                 .apiName,
                 .access,
                 .override,
                 .declaration,
                 .id,
                 .bind,
                 .location,
                 .range,
                 .failable,
                 .argumentLabels,
                 .names,
                 .functionReference,
                 .typeRepresantation,
                 .storageKind,
                 .getter,
                 .accessKind,
                 .setter,
                 .materializeForSet,
                 .value:
                return try tokenWithIdentifier(for: rawToken)
            default:
                continue
            }
        }
        return nil
    }
    
    enum Token: CustomStringConvertible, Equatable {
        
        // pass-through tokens
        case implicit
        case interface
        case superReference
        case objc
        case nonResilient
        case dynamic
        case noThrow
        case designated
        case required
        case directToStorage
        case inOut
        
        // token with identifier
        case type(String)
        case apiName(String)
        case access(String)
        case override(String)
        case declaration(String)
        case id(String)
        case bind(String)
        case location(String)
        case range(String)
        case failable(String)
        case argumentLabels(String)
        case names(String)
        case functionReference(String)
        case typeRepresantation(String)
        case storageKind(String)
        case getter(String)
        case accessKind(String)
        case setter(String)
        case materializeForSet(String)
        case value(String)
        
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
            case .access(let rawToken):
                return "access: \(rawToken)"
            case .implicit:
                return "implicit"
            case .interface:
                return "interface"
            case .superReference:
                return "super"
            case .apiName(let identifier):
                return "apiName: \(identifier)"
            case .type(let identifier):
                return "type: \(identifier)"
            case .override(let identifier):
                return "override: \(identifier)"
            case .declaration(let identifier):
                return "declaration: \(identifier)"
            case .id(let identifier):
                return "id: \(identifier)"
            case .bind(let identifier):
                return "bind: \(identifier)"
            case .objc:
                return "objc"
            case .nonResilient:
                return "nonResilient"
            case .dynamic:
                return "dynamic"
            case .noThrow:
                return "noThrow"
            case .designated:
                return "designated"
            case .required:
                return "required"
            case .directToStorage:
                return "directToStorage"
            case .inOut:
                return "inOut"
            case .location(let identifier):
                return "location: \(identifier)"
            case .range(let identifier):
                return "range: \(identifier)"
            case .failable(let identifier):
                return "failable: \(identifier)"
            case .argumentLabels(let identifier):
                return "argumentLabels: \(identifier)"
            case .names(let identifier):
                return "names: \(identifier)"
            case .functionReference(let identifier):
                return "functionReference: \(identifier)"
            case .typeRepresantation(let identifier):
                return "typeRepresentation: \(identifier)"
            case .storageKind(let identifier):
                return "storageKind: \(identifier)"
            case .getter(let identifier):
                return "getter: \(identifier)"
            case .accessKind(let identifier):
                return "accessKind: \(identifier)"
            case .setter(let identifier):
                return "setter: \(identifier)"
            case .materializeForSet(let identifier):
                return "materializeForSet: \(identifier)"
            case .value(let identifier):
                return "value: \(identifier)"
            }
        }
        
    }
    
    // MARK: - Private -
    
    private var rawTokenizer: RawTokenizer
    private var pushedBackRawToken: RawTokenizer.RawToken?
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
        if let pushedBackRawToken = pushedBackRawToken {
            self.pushedBackRawToken = nil
            return pushedBackRawToken
        }
        return rawTokenizer.nextToken()
    }
    
    private func scopeStartToken(with rawToken: RawTokenizer.RawToken) throws -> Token {
        unclosedLeftParenthesisCount -= 1
        var scopeStart = Token.scopeStart(rawToken, identifier: nil)
        loop: while let nextRawToken = nextRawToken() {
            switch nextRawToken {
            case .range:
                let _ = self.nextRawToken() // skip range
            case var .identifier(identifier):
                if rawToken == .sourceFile {
                    identifier = (identifier.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? "") + "SourceFile"
                } else if identifier.contains("SourceFile") {
                    
                }
                scopeStart = Token.scopeStart(rawToken, identifier: identifierPrefix + identifier)
                break loop
            default:
                pushedBackRawToken = nextRawToken
                break loop
            }
        }
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
                pushedBackRawToken = rawToken
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
                case .apiName:
                    return .apiName(identifier)
                case .access:
                    return .access(identifier)
                case .override:
                    return .override(identifier.components(separatedBy: ".").dropFirst(2).joined(separator: "."))
                case .declaration:
                    return .declaration(identifier.components(separatedBy: ".").dropFirst(2).joined(separator: "."))
                case .id:
                    return .id(identifier)
                case .bind:
                    return .bind(identifier.components(separatedBy: ".").dropFirst(2).joined(separator: "."))
                case .location:
                    return .location(identifier)
                case .range:
                    return .range(identifier)
                case .failable:
                    return .failable(identifier)
                case .argumentLabels:
                    return .argumentLabels(identifier)
                case .names:
                    return .names(identifier)
                case .functionReference:
                    return .functionReference(identifier)
                case .typeRepresantation:
                    return .typeRepresantation(identifier)
                case .storageKind:
                    return .storageKind(identifier)
                case .getter:
                    return .getter(identifier)
                case .accessKind:
                    return .accessKind(identifier)
                case .setter:
                    return .setter(identifier)
                case .materializeForSet:
                    return .materializeForSet(identifier)
                case .value:
                    return .value(identifier)
                default:
                    throw ErrorEnum.invalidToken(initialRawToken)
                }
            default:
                throw ErrorEnum.invalidToken(initialRawToken)
            }
        }
        throw ErrorEnum.invalidToken(initialRawToken)
    }
    
}
