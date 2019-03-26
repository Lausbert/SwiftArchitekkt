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
        case leftParenthesis
        case rightParenthesis
        case nameIdentifier(String)
        case typeIdentifier(String)
        case tag(String)
        
        // followed by identifier
        case scope(String)

        // followed by identifiers
        case type
        case inherits

    }

    func nextToken() -> RawToken? {
        while let ch = nextScalar() {
            switch ch {
            case " ", "\n", "\\":
                continue
            case ",":
                return .comma
            case "(":
                return .leftParenthesis
            case ")":
                return .rightParenthesis
            case "[":
                return .tag(identifier(endingWith: "]"))
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

    private func nextScalar() -> UnicodeScalar? {
        if let next = pushedBackScalar {
            pushedBackScalar = nil
            return next
        }
        return iterator.next()
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

    private func keywordToken(startingWith first: UnicodeScalar) -> RawToken {
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
        case "source_file":
            return .scope("sourceFile")
        case "class_decl":
            return .scope("class")
        case "struct_decl":
            return .scope("struct")
        case "enum_decl":
            return .scope("enum")
        case "protocol":
            return .scope("protocol")
        case "var_decl":
            return .scope("variable")
        case "func_decl":
            return .scope("function")
        case "type=":
            return .type
        case "inherits:":
            return .inherits
        default:
            return .tag(tokenText)
        }
    }

}
