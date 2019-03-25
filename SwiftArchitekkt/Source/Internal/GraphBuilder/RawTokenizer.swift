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
        case unknown(String)

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

        loop: while let ch = nextScalar() {
            switch ch {
            case " ",
                 "\n",
                 ",",
                 "(",
                 ")",
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
        case "type=":
            return .type
        case "inherits:":
            return .inherits
        default:
            return .unknown(tokenText)
        }
    }

}
