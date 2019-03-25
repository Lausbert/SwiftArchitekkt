//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

class RawTokenizer {

    // MARK: - Internal -

    init(ast: String) {
        iterator = ast.unicodeScalars.makeIterator()
    }

    enum RawToken: Equatable {

        // helper tokens
        case comma
        case colon
        case leftParenthesis
        case rightParenthesis
        case identifier(String)
        case nameIdentifier(String)

        // followed by identifier
        case type

        // followed by identifiers
        case inherits

        // named scopes
        case sourceFile
        case classDeclaration
        case funcDeclaration
        case varDeclaration

    }

    func nextToken() -> RawToken? {
        while let ch = nextScalar() {
            switch ch {
            case " ", "\n":
                continue
            case "\\":
                continue
            case ",":
                return .comma
            case ":":
                return .colon
            case "(":
                return .leftParenthesis
            case ")":
                return .rightParenthesis
            case "=":
                return identifierTokenAfterEqual()
            case "[":
                return .identifier(identifier(endingWith: "]"))
            case "\"":
                return .nameIdentifier(identifier(endingWith: "\""))
            case "'":
                return .identifier(identifier(endingWith: "'"))
            default:
                return keywordToken(startingWith: ch)
            }
        }
        return nil
    }

    // MARK: - Private -

    private var iterator: String.UnicodeScalarView.Iterator
    private var pushedBackScalar: UnicodeScalar?

    private func nextScalar() -> UnicodeScalar? {
        if let next = pushedBackScalar {
            pushedBackScalar = nil
            return next
        }
        return iterator.next()
    }

    private func identifierTokenAfterEqual() -> RawToken? {
        if let ch = nextScalar() {
            switch ch {
            case "[":
                return .identifier(identifier(endingWith: "]"))
            case "\"":
                return .nameIdentifier(identifier(endingWith: "\""))
            case "'":
                return .identifier(identifier(endingWith: "'"))
            case "\n":
                return .identifier("")
            case "(":
                return .identifier(identifier(endingWith: ")"))
            default:
                return .identifier(identifier(endingWith: " "))
            }
        } else {
            return nil
        }
    }

    private func identifier(startingWith first: UnicodeScalar? = nil, endingWith last: UnicodeScalar) -> String {
        var tokenText: String
        if let first = first {
            tokenText = String(first)
        } else {
            tokenText = ""
        }
        var allowedRightParenthesis = 0

        while let ch = nextScalar() {
            switch ch {
            case "(":
                allowedRightParenthesis += 1
                tokenText.unicodeScalars.append(ch)
            case ")":
                if allowedRightParenthesis < 1 {
                    if last != ")" {
                        pushedBackScalar = ch
                    }
                    return tokenText
                } else {
                    allowedRightParenthesis -= 1
                    tokenText.unicodeScalars.append(ch)
                }
            case last,
                 "\n":
                return tokenText
            default:
                tokenText.unicodeScalars.append(ch)
            }
        }
        return tokenText
    }

    private func keywordToken(startingWith first: UnicodeScalar) -> RawToken {
        var tokenText = String(first)

        loop: while let ch = nextScalar() {
            switch ch {
            case " ",
                 "\n",
                 "\\",
                 "=",
                 ",",
                 ":",
                 "(",
                 ")",
                 "[",
                 "]",
                 "\"",
                 "'":
                pushedBackScalar = ch
                break loop
            default:
                tokenText.unicodeScalars.append(ch)
            }
        }

        switch tokenText {
        case "source_file":
            return .sourceFile
        case "class_decl":
            return .classDeclaration
        case "var_decl":
            return .varDeclaration
        case "func_decl":
            return .funcDeclaration
        case "type":
            return .type
        case "inherits":
            return .inherits
        default:
            return .identifier(tokenText)
        }
    }

}
