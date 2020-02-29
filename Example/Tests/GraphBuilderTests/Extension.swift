//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension GraphBuilderTests {

    func testGraphBuilderForClassExtension() {
        // class Class {}
        // extension Class {}
        let ast = """
(source_file "test.swift"
  (class_decl range=[test.swift:1:1 - line:1:14] "Class" interface type='Class.Type' access=internal non-resilient
    (constructor_decl implicit range=[test.swift:1:7 - line:1:7] "init()" interface type='(Class.Type) -> () -> Class' access=internal designated
      (parameter "self" interface type='Class')
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))
    (destructor_decl implicit range=[test.swift:1:7 - line:1:7] "deinit" interface type='(Class) -> () -> ()' access=internal @objc
      (parameter "self" interface type='Class')
      (parameter_list)
      (brace_stmt implicit range=[test.swift:1:7 - line:1:7])))
  (extension_decl range=[test.swift:2:1 - line:2:18] Class))
"""
        let expectedGraphString = """
{
  "children" : [
    {
      "identifier" : "Class.Type",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "arcs" : [
            {
              "identifier" : "Class.Type",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "children" : [
            {
              "arcs" : [
                {
                  "identifier" : "Class.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "identifier" : "Class.init().self",
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
              "identifier" : "Class.init()",
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
              "children" : [
                {
                  "identifier" : "Class.deinit.self",
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
              "identifier" : "Class.deinit",
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
          "identifier" : "Class",
          "isRoot" : false,
          "scope" : "class_decl",
          "tags" : [
            "access=internal",
            "interface",
            "non-resilient"
          ]
        },
        {
          "arcs" : [
            {
              "identifier" : "Class",
              "isRoot" : false,
              "scope" : "class_decl"
            }
          ],
          "identifier" : "extension_decl.@@@",
          "isRoot" : false,
          "scope" : "extension_decl"
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

    func testGraphBuilderForGenericClassExtension() {
        // class Generic<T> {}
        // extension Generic {}
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
      (brace_stmt implicit range=[test.swift:1:7 - line:1:7])))
  (extension_decl range=[test.swift:2:1 - line:2:20] Generic<T>))
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
        },
        {
          "arcs" : [
            {
              "identifier" : "Generic",
              "isRoot" : false,
              "scope" : "class_decl"
            },
            {
              "identifier" : "T",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "extension_decl.@@@",
          "isRoot" : false,
          "scope" : "extension_decl"
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
