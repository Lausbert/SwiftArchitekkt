//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension GraphBuilderTests {

    func testGraphBuilderForGenericClassWithSingleGenericParameter() {
        // class Generic<T> {}
        let ast = """
(source_file "test.swift"
  (class_decl range=[test.swift:1:1 - line:1:19] "Generic" <T> interface type='Generic<T>.Type' access=internal non-resilient
    (constructor_decl implicit range=[test.swift:1:7 - line:1:7] "init()" interface type='<T> (Generic<T>.Type) -> () -> Generic<T>' access=internal designated
      (parameter "self" interface type='Generic<T>')
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))
    (destructor_decl implicit range=[test.swift:1:7 - line:1:7] "deinit" interface type='<T> (Generic<T>) -> () -> ()' access=internal @objc
      (parameter "self" interface type='Generic<T>')
      (parameter_list)
      (brace_stmt implicit range=[test.swift:1:7 - line:1:7]))))
"""
        let expectedGraphString = """
{
  "children" : [
    {
      "identifier" : "Generic.Type",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "T",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "arcs" : [
            {
              "identifier" : "Generic.Type",
              "isRoot" : false,
              "scope" : "unknown"
            },
            {
              "identifier" : "T",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "children" : [
            {
              "arcs" : [
                {
                  "identifier" : "Generic.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "T",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "T",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "identifier" : "Generic.init().self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "children" : [
                    {
                      "isRoot" : false,
                      "scope" : "return_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                }
              ],
              "identifier" : "Generic.init()",
              "isRoot" : false,
              "scope" : "constructor_decl",
              "tags" : [
                "access=internal",
                "designated",
                "implicit",
                "interface"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "T",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "T",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "identifier" : "Generic.deinit.self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                }
              ],
              "identifier" : "Generic.deinit",
              "isRoot" : false,
              "scope" : "destructor_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "implicit",
                "interface"
              ]
            }
          ],
          "identifier" : "Generic",
          "isRoot" : false,
          "scope" : "class_decl",
          "tags" : [
            "T",
            "access=internal",
            "interface",
            "non-resilient"
          ]
        }
      ],
      "identifier" : "testSourceFile",
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

    func testGraphBuilderForGenericClassWithMultipleGenericParameter() {
        // class Generic<T, U> {}
        let ast = """
(source_file "test.swift"
  (class_decl range=[test.swift:1:1 - line:1:22] "Generic" <T, U> interface type='Generic<T, U>.Type' access=internal non-resilient
    (constructor_decl implicit range=[test.swift:1:7 - line:1:7] "init()" interface type='<T, U> (Generic<T, U>.Type) -> () -> Generic<T, U>' access=internal designated
      (parameter "self" interface type='Generic<T, U>')
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))
    (destructor_decl implicit range=[test.swift:1:7 - line:1:7] "deinit" interface type='<T, U> (Generic<T, U>) -> () -> ()' access=internal @objc
      (parameter "self" interface type='Generic<T, U>')
      (parameter_list)
      (brace_stmt implicit range=[test.swift:1:7 - line:1:7]))))
"""
        let expectedGraphString = """
{
  "children" : [
    {
      "identifier" : "Generic.Type",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "T",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "U",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "arcs" : [
            {
              "identifier" : "Generic.Type",
              "isRoot" : false,
              "scope" : "unknown"
            },
            {
              "identifier" : "T",
              "isRoot" : false,
              "scope" : "unknown"
            },
            {
              "identifier" : "U",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "children" : [
            {
              "arcs" : [
                {
                  "identifier" : "Generic.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "T",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "U",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "T",
                      "isRoot" : false,
                      "scope" : "unknown"
                    },
                    {
                      "identifier" : "U",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "identifier" : "Generic.init().self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "children" : [
                    {
                      "isRoot" : false,
                      "scope" : "return_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                }
              ],
              "identifier" : "Generic.init()",
              "isRoot" : false,
              "scope" : "constructor_decl",
              "tags" : [
                "access=internal",
                "designated",
                "implicit",
                "interface"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "T",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "U",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "T",
                      "isRoot" : false,
                      "scope" : "unknown"
                    },
                    {
                      "identifier" : "U",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "identifier" : "Generic.deinit.self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                }
              ],
              "identifier" : "Generic.deinit",
              "isRoot" : false,
              "scope" : "destructor_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "implicit",
                "interface"
              ]
            }
          ],
          "identifier" : "Generic",
          "isRoot" : false,
          "scope" : "class_decl",
          "tags" : [
            "T, U",
            "access=internal",
            "interface",
            "non-resilient"
          ]
        }
      ],
      "identifier" : "testSourceFile",
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

    func testGraphBuilderForGenericFunctionWithSingleGenericParameter() {
        // func generic<T>(t: T) {}
        let ast = """
(source_file "test.swift"
  (func_decl range=[test.swift:1:1 - line:1:24] "generic(t:)" <T> interface type='<T> (t: T) -> ()' access=internal captures=(<generic> )
    (parameter_list
      (parameter "t" apiName=t interface type='T') range=[test.swift:1:16 - line:1:21])
    (brace_stmt range=[test.swift:1:23 - line:1:24])))
"""
        let expectedGraphString = """
{
  "children" : [
    {
      "identifier" : "T",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "arcs" : [
            {
              "identifier" : "T",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "children" : [
            {
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "T",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "identifier" : "generic(t:).t",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "apiName=t",
                    "interface"
                  ]
                }
              ],
              "isRoot" : false,
              "scope" : "parameter_list"
            },
            {
              "isRoot" : false,
              "scope" : "brace_stmt"
            }
          ],
          "identifier" : "generic(t:)",
          "isRoot" : false,
          "scope" : "func_decl",
          "tags" : [
            "T",
            "access=internal",
            "captures=(<generic> )",
            "interface"
          ]
        }
      ],
      "identifier" : "testSourceFile",
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
