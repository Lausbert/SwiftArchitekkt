//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension GraphBuilderTest {

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
      "identifier" : "Builtin.IntLiteral",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "Int",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "Int.Type",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "IntLiteral",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "children" : [
            {
              "children" : [
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
                      "isRoot" : false,
                      "scope" : "pattern_named",
                      "tags" : [
                        "Test"
                      ]
                    },
                    {
                      "arcs" : [
                        {
                          "identifier" : "Int",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "IntLiteral",
                              "isRoot" : false,
                              "scope" : "unknown"
                            },
                            {
                              "identifier" : "Int",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "Int.Type",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                },
                                {
                                  "identifier" : "IntLiteral",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                },
                                {
                                  "identifier" : "Int",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit",
                                "location=Test.swift:1:12"
                              ]
                            },
                            {
                              "arcs" : [
                                {
                                  "identifier" : "Int.Type",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "type_expr",
                              "tags" : [
                                "Int",
                                "implicit",
                                "location=Test.swift:1:12",
                                "typerepr="
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "implicit",
                            "location=Test.swift:1:12",
                            "nothrow"
                          ]
                        },
                        {
                          "arcs" : [
                            {
                              "identifier" : "Builtin.IntLiteral",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "Builtin.IntLiteral",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "integer_literal_expr",
                              "tags" : [
                                "location=Test.swift:1:12",
                                "value=1"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "tuple_expr",
                          "tags" : [
                            "implicit",
                            "location=Test.swift:1:12",
                            "names=_builtinIntegerLiteral"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "call_expr",
                      "tags" : [
                        "implicit",
                        "location=Test.swift:1:12",
                        "nothrow"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "pattern_binding_decl"
                }
              ],
              "isRoot" : false,
              "scope" : "brace_stmt",
              "tags" : [
                "implicit"
              ]
            }
          ],
          "isRoot" : false,
          "scope" : "top_level_code_decl"
        },
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
          "scope" : "var_decl",
          "tags" : [
            "access=internal",
            "interface",
            "readImpl=stored",
            "readWriteImpl=stored",
            "writeImpl=stored"
          ]
        }
      ],
      "identifier" : "TestSourceFile",
      "isRoot" : false,
      "scope" : "source_file"
    }
  ],
  "identifier" : "testModule",
  "isRoot" : false,
  "scope" : "module"
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
      "identifier" : "Builtin.IntLiteral",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "Int",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "Int.Type",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "IntLiteral",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "children" : [
            {
              "children" : [
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
                      "isRoot" : false,
                      "scope" : "pattern_named",
                      "tags" : [
                        "Test"
                      ]
                    },
                    {
                      "arcs" : [
                        {
                          "identifier" : "Int",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "IntLiteral",
                              "isRoot" : false,
                              "scope" : "unknown"
                            },
                            {
                              "identifier" : "Int",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "Int.Type",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                },
                                {
                                  "identifier" : "IntLiteral",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                },
                                {
                                  "identifier" : "Int",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit",
                                "location=Test.swift:1:12"
                              ]
                            },
                            {
                              "arcs" : [
                                {
                                  "identifier" : "Int.Type",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "type_expr",
                              "tags" : [
                                "Int",
                                "implicit",
                                "location=Test.swift:1:12",
                                "typerepr="
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "implicit",
                            "location=Test.swift:1:12",
                            "nothrow"
                          ]
                        },
                        {
                          "arcs" : [
                            {
                              "identifier" : "Builtin.IntLiteral",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "Builtin.IntLiteral",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "integer_literal_expr",
                              "tags" : [
                                "location=Test.swift:1:12",
                                "value=1"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "tuple_expr",
                          "tags" : [
                            "implicit",
                            "location=Test.swift:1:12",
                            "names=_builtinIntegerLiteral"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "call_expr",
                      "tags" : [
                        "implicit",
                        "location=Test.swift:1:12",
                        "nothrow"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "pattern_binding_decl"
                }
              ],
              "isRoot" : false,
              "scope" : "brace_stmt",
              "tags" : [
                "implicit"
              ]
            }
          ],
          "isRoot" : false,
          "scope" : "top_level_code_decl"
        },
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
          "scope" : "var_decl",
          "tags" : [
            "access=internal",
            "immutable",
            "interface",
            "let",
            "readImpl=stored"
          ]
        }
      ],
      "identifier" : "TestSourceFile",
      "isRoot" : false,
      "scope" : "source_file"
    }
  ],
  "identifier" : "testModule",
  "isRoot" : false,
  "scope" : "module"
}
"""
        testGraphBuilderFor(ast: ast, expectedGraphString: expectedGraphString)
    }

}
