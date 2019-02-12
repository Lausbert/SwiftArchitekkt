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
        
        // followed by identifier
        case importDeclaration
        case type
        case apiName
        case access
        case override
        case declaration
        case id
        case bind
        case location
        case range
        case failable
        case argumentLabels
        case names
        case functionReference
        case typeRepresantation
        case storageKind
        case getter
        case accessKind
        case setter
        case materializeForSet
        case value
        
        // followed by identifiers
        case inherits
        
        // named scopes
        case classDeclaration
        case funcDeclaration
        case varDeclaration
        case parameter
        
        // anonymous scopes
        case sourceFile
        case accessorDeclaration
        case parameterList
        case constructorDeclaration
        case destructorDeclaration
        case braceStatement
        case callExpression
        case dotSyntaxCallExpression
        case declarationReferenceExpression
        case superReferenceExpression
        case tupleExpression
        case rebindSelfInConstructorExpression
        case otherConstructorReferenceExpression
        case returnStatement
        case patternBindingDeclaration
        case patternTyped
        case patternNamed
        case typeExpression
        case loadExpression
        case memberReferenceExpression
        case constructorReferenceCallExpression
        case result
        case typeId
        case component
        case assignExpression
        
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
                return identifierToken(endingWith: "]")
            case "\"":
                return identifierToken(endingWith: "\"")
            case "'":
                return identifierToken(endingWith: "'")
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
                return identifierToken(endingWith: "]")
            case "\"":
                return identifierToken(endingWith: "\"")
            case "'":
                return identifierToken(endingWith: "'")
            case "\n":
                return .identifier("")
            default:
                return identifierToken(startingWith: ch, endingWith: " ")
            }
        } else {
            return nil
        }
    }
    
    private func identifierToken(startingWith first: UnicodeScalar? = nil, endingWith last: UnicodeScalar) -> RawToken {
        var tokenText: String
        if let first = first {
            tokenText = String(first)
        } else {
            tokenText = ""
        }
        var allowedRightParenthesis = 0
        
        while let ch = nextScalar() {
            switch ch {
            case last,
                 "\n":
                return .identifier(tokenText)
            case "(":
                allowedRightParenthesis += 1
                tokenText.unicodeScalars.append(ch)
            case ")":
                if allowedRightParenthesis < 1 {
                    pushedBackScalar = ch
                    return .identifier(tokenText)
                } else {
                    allowedRightParenthesis -= 1
                    tokenText.unicodeScalars.append(ch)
                }
            default:
                tokenText.unicodeScalars.append(ch)
            }
        }
        return .identifier(tokenText)
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
        case "@objc":
            return .objc
        case "source_file":
            return .sourceFile
        case "class_decl":
            return .classDeclaration
        case "constructor_decl":
            return .constructorDeclaration
        case "destructor_decl":
            return .destructorDeclaration
        case "var_decl":
            return .varDeclaration
        case "accessor_decl":
            return .accessorDeclaration
        case "func_decl":
            return .funcDeclaration
        case "import_decl":
            return .importDeclaration
        case "interface":
            return .interface
        case "parameter_list":
            return .parameterList
        case "type":
            return .type
        case "access":
            return .access
        case "non-resilient":
            return .nonResilient
        case "inherits":
            return .inherits
        case "override":
            return .override
        case "dynamic":
            return .dynamic
        case "parameter":
            return .parameter
        case "brace_stmt":
            return .braceStatement
        case "call_expr":
            return .callExpression
        case "location":
            return .location
        case "range":
            return .range
        case "nothrow":
            return .noThrow
        case "arg_labels":
            return .argumentLabels
        case "dot_syntax_call_expr":
            return .dotSyntaxCallExpression
        case "super":
            return .superReference
        case "declref_expr":
            return .declarationReferenceExpression
        case "decl":
            return .declaration
        case "function_ref":
            return .functionReference
        case "super_ref_expr":
            return .superReferenceExpression
        case "tuple_expr":
            return .tupleExpression
        case "implicit":
            return .implicit
        case "designated":
            return .designated
        case "apiName":
            return .apiName
        case "rebind_self_in_constructor_expr":
            return .rebindSelfInConstructorExpression
        case "other_constructor_ref_expr":
            return .otherConstructorReferenceExpression
        case "names":
            return .names
        case "return_stmt":
            return .returnStatement
        case "required":
            return .required
        case "failable":
            return .failable
        case "pattern_binding_decl":
            return .patternBindingDeclaration
        case "pattern_typed":
            return .patternTyped
        case "pattern_named":
            return .patternNamed
        case "type_expr":
            return .typeExpression
        case "typerepr":
            return .typeRepresantation
        case "storage_kind":
            return .storageKind
        case "getter_for":
            return .getter
        case "load_expr":
            return .loadExpression
        case "member_ref_expr":
            return .memberReferenceExpression
        case "accessKind":
            return .accessKind
        case "direct_to_storage":
            return .directToStorage
        case "setter_for":
            return .setter
        case "assign_expr":
            return .assignExpression
        case "materializeForSet_for":
            return .materializeForSet
        case "inout":
            return .inOut
        case "result":
            return .result
        case "type_ident":
            return .typeId
        case "id":
            return .id
        case "bind":
            return .bind
        case "constructor_ref_call_expr":
            return .constructorReferenceCallExpression
        case "value":
            return .value
        case "component":
            return .component
        default:
            return .identifier(tokenText)
        }
    }
    
}
