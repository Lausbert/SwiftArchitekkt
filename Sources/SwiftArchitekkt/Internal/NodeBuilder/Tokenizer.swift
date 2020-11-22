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
        case unexpectlyFoundNoTypeName

        var errorDescription: String? {
            switch self {
            case .unexpectedlyReachedScopeEnd:
                return "Unexpectedly reached scope end."
            case .unexpectlyFoundNoTypeName:
                return "Unexpectly found no typeName."
            }
        }
    }

    enum Token: CustomStringConvertible, Equatable {

        // token with names
        case type([String])
        case inherits([String])
        case tag(String)

        // scope tokens
        case scopeStart(String, name: String?)
        case scopeEnd(String, name: String?)

        var description: String {
            switch self {
            case let .scopeStart(scope, name):
                return name == nil ? "scopeStart: \(scope)" : "scopeStart: \(scope), \(name ?? "")"
            case let .scopeEnd(scope, name):
                return name == nil ? "scopeEnd: \(scope)" : "scopeEnd: \(scope), \(name ?? "")"
            case let .inherits(names):
                return "inherits: \(names)"
            case let .type(names):
                return "type: \(names)"
            case let .tag(name):
                return "tag: \(name)"
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
                if let scopeStart = openScopes.last, case let .scopeStart(scope, name: _) = scopeStart, scope == "import_decl" {
                    return .type([name(endingWith: "'")])
                } else {
                    return .tag(name(endingWith: "'"))
                }
            case "[":
                return .tag(name(endingWith: "]", oneTimeExceptionForEvery: "["))
            case "<":
                return .tag(name(endingWith: ">"))
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
    private var namePrefix: String {
        for openScope in openScopes.reversed() {
            if case let .scopeStart(scope, name) = openScope, scope != "source_file", let na = name {
                return na + "."
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

        var allowedRightParenthesis = 0
        var pushedBackScalars: [UnicodeScalar] = []
        var na: String?
        loop: while let ch = nextScalar() {
            switch ch {
            case "\n":
                pushedBackScalars.append(ch)
                break loop
            case "(":
                allowedRightParenthesis += 1
                pushedBackScalars.append(ch)
            case ")":
                if allowedRightParenthesis <= 0 {
                    pushedBackScalars.append(ch)
                    break loop
                } else {
                    pushedBackScalars.append(ch)
                    allowedRightParenthesis -= 1
                }
            case "\"":
                if pushedBackScalars.last == " " {
                    na = namePrefix + name(endingWith: "\"")
                    if scope == "source_file", let strongName = na {
                        na = (strongName.components(separatedBy: "/").last?.components(separatedBy: ".").first ?? "") + "SourceFile"
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
            let scopeStart = Token.scopeStart(scope, name: na)
            openScopes.append(scopeStart)
            while let newToken = try nextToken() {
                if case let Token.scopeEnd(scope, name: _) = newToken, scope == "if_config_decl" {
                    return try nextToken()
                }
            }
            return nil
        case "extension_decl": // i have forgotten, why I did this; anyway if i remove it, some strange things happen in SKArchitekkt; investigate further if there is time in the future
            na = namePrefix + "extension_decl_" +  UUID().uuidString
        default:
            break
        }

        let scopeStart = Token.scopeStart(scope, name: na)
        openScopes.append(scopeStart)
        return scopeStart
    }

    private func scopeEndToken() throws -> Token {
        guard let scopeStart = openScopes.popLast(), case let .scopeStart(scope, name) = scopeStart else { throw ErrorEnum.unexpectedlyReachedScopeEnd }
        return .scopeEnd(scope, name: name)
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
                let value = name(endingWith: "\"")
                return .tag(tokenText + value)
            } else {
                return .tag(tokenText)
            }
        default:
            if let scopeStart = openScopes.last, case let .scopeStart(scope, name: _) = scopeStart, scope == "extension_decl", !tokenText.contains("=") {
                return .type(typeNames(forTypeName: tokenText))
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
        guard ch == "'" else { throw ErrorEnum.unexpectlyFoundNoTypeName }
        let na = name(endingWith: "'")
        return .type(typeNames(forTypeName: na))
    }

    private func inheritsToken() -> Token {
        let na = name(endingWith: "\n", pushBackLast: ")")
        let names = na.replacingOccurrences(of: " ", with: "").components(separatedBy: [",", "&"])
        return .inherits(names)
    }

    private func name(endingWith last: UnicodeScalar, oneTimeExceptionForEvery first: UnicodeScalar? = nil, pushBackLast: UnicodeScalar? = nil) -> String {
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

    private func typeNames(forTypeName na: String) -> [String] {
        let na = moveGenericParametersToTheEnd(inTypeName: na)
        let names = na.replacingOccurrences(of: "?", with: "")
            .replacingOccurrences(of: ".Type", with: "")
            .replacingOccurrences(of: "[\\[\\]()<>,-]", with: " ", options: .regularExpression)
            .components(separatedBy: " ")
            .uniqued()
            .filter { !$0.isEmpty && !["inout", "where", "throws", "Self", "block", "__owned", "__shared", "=="].contains($0) && ![":"].contains($0.last) && !["@"].contains($0.first)}
        return names
    }

    private func moveGenericParametersToTheEnd(inTypeName na: String) -> String {
        var na = na.replacingOccurrences(of: "->", with: " ")
        while true {
            guard let range = Regex.getResult(for: StaticString(stringLiteral: "<[^<]+?>"), text: na, captureGroup: 0).first?.range else { break }
            let genericName = String(na[na.index(after: range.lowerBound)..<na.index(before: range.upperBound)])
            let naBefore = na[..<range.lowerBound]
            let naAfter = String(na[range.upperBound...])
            na = naBefore + naAfter + " " + genericName
        }
        return na
    }
}
