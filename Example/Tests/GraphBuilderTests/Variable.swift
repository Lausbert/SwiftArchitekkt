//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension GraphBuilderTests {
    
    func testGraphBuilderForSingleVariable() {
        // var Test = 1
        let ast = """
(source_file "Test.swift"
  (top_level_code_decl range=[Test.swift:1:1 - line:1:12]
    (brace_stmt implicit range=[Test.swift:1:1 - line:1:12]
      (pattern_binding_decl range=[Test.swift:1:1 - line:1:12]
        (pattern_named type='Int' 'Test')
        (call_expr implicit type='Int' location=Test.swift:1:12 range=[Test.swift:1:12 - line:1:12] nothrow arg_labels=_builtinIntegerLiteral:
          (constructor_ref_call_expr implicit type='(IntLiteral) -> Int' location=Test.swift:1:12 range=[Test.swift:1:12 - line:1:12] nothrow
            (declref_expr implicit type='(Int.Type) -> (IntLiteral) -> Int' location=Test.swift:1:12 range=[Test.swift:1:12 - line:1:12] decl=Swift.(file).Int.init(_builtinIntegerLiteral:) function_ref=single)
            (type_expr implicit type='Int.Type' location=Test.swift:1:12 range=[Test.swift:1:12 - line:1:12] typerepr='Int'))
          (tuple_expr implicit type='(_builtinIntegerLiteral: Builtin.IntLiteral)' location=Test.swift:1:12 range=[Test.swift:1:12 - line:1:12] names=_builtinIntegerLiteral
            (integer_literal_expr type='Builtin.IntLiteral' location=Test.swift:1:12 range=[Test.swift:1:12 - line:1:12] value=1))))
))
  (var_decl range=[Test.swift:1:5 - line:1:5] "Test" type='Int' interface type='Int' access=internal readImpl=stored writeImpl=stored readWriteImpl=stored))
"""
        let expectedGraphString = """
{
  "children" : [
    {
      "identifier" : "Int",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "arcs" : [
            {
              "identifier" : "Int",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "Test",
          "isRoot" : false,
          "scope" : "variable"
        }
      ],
      "identifier" : "TestSourceFile",
      "isRoot" : false,
      "scope" : "sourceFile"
    }
  ],
  "isRoot" : true,
  "scope" : "root"
}
"""
        testGraphBuilderFor(ast: ast, expectedGraphString: expectedGraphString)
    }
    
    func testGraphBuilderForSingleConstant() {
        // let Test = 1
        let ast = """
(source_file "Test.swift"
  (top_level_code_decl range=[Test.swift:1:1 - line:1:12]
    (brace_stmt implicit range=[Test.swift:1:1 - line:1:12]
      (pattern_binding_decl range=[Test.swift:1:1 - line:1:12]
        (pattern_named type='Int' 'Test')
        (call_expr implicit type='Int' location=Test.swift:1:12 range=[Test.swift:1:12 - line:1:12] nothrow arg_labels=_builtinIntegerLiteral:
          (constructor_ref_call_expr implicit type='(IntLiteral) -> Int' location=Test.swift:1:12 range=[Test.swift:1:12 - line:1:12] nothrow
            (declref_expr implicit type='(Int.Type) -> (IntLiteral) -> Int' location=Test.swift:1:12 range=[Test.swift:1:12 - line:1:12] decl=Swift.(file).Int.init(_builtinIntegerLiteral:) function_ref=single)
            (type_expr implicit type='Int.Type' location=Test.swift:1:12 range=[Test.swift:1:12 - line:1:12] typerepr='Int'))
          (tuple_expr implicit type='(_builtinIntegerLiteral: Builtin.IntLiteral)' location=Test.swift:1:12 range=[Test.swift:1:12 - line:1:12] names=_builtinIntegerLiteral
            (integer_literal_expr type='Builtin.IntLiteral' location=Test.swift:1:12 range=[Test.swift:1:12 - line:1:12] value=1))))
))
  (var_decl range=[Test.swift:1:5 - line:1:5] "Test" type='Int' interface type='Int' access=internal let readImpl=stored immutable))
"""
        let expectedGraphString = """
{
  "children" : [
    {
      "identifier" : "Int",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "arcs" : [
            {
              "identifier" : "Int",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "Test",
          "isRoot" : false,
          "scope" : "variable"
        }
      ],
      "identifier" : "TestSourceFile",
      "isRoot" : false,
      "scope" : "sourceFile"
    }
  ],
  "isRoot" : true,
  "scope" : "root"
}
"""
        testGraphBuilderFor(ast: ast, expectedGraphString: expectedGraphString)
    }
    
}
