//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension GraphBuilderTest {

    func testGraphBuilderForEmptyStruct() {
        // struct Test {}
        let ast = """
(source_file "Test.swift"
  (struct_decl range=[Test.swift:1:1 - line:1:14] "Test" interface type='Test.Type' access=internal non-resilient
    (constructor_decl implicit range=[Test.swift:1:8 - line:1:8] "init()" interface type='(Test.Type) -> () -> Test' access=internal designated
      (parameter "self" interface type='Test' inout)
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))))
"""
        let expectedGraphString = """
{
  "children" : [
    {
      "children" : [
        {
          "arcs" : [
            {
              "identifier" : "Test.Type",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "children" : [
            {
              "arcs" : [
                {
                  "identifier" : "Test.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "identifier" : "Test.init().self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "inout",
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
              "identifier" : "Test.init()",
              "isRoot" : false,
              "scope" : "constructor_decl",
              "tags" : [
                "access=internal",
                "designated",
                "implicit",
                "interface"
              ]
            }
          ],
          "identifier" : "Test",
          "isRoot" : false,
          "scope" : "struct_decl",
          "tags" : [
            "access=internal",
            "interface",
            "non-resilient"
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

    func testGraphBuilderForStructProtocolConformance() {
        // protocol Protocol {}
        // struct Test: Protocol {}
        let ast = """
(source_file "Test.swift"
  (protocol range=[Test.swift:1:1 - line:1:20] "Protocol" <Self : Protocol> interface type='Protocol.Protocol' access=internal non-resilient requirement signature=<Self>)
  (struct_decl range=[Test.swift:2:1 - line:2:24] "Test" interface type='Test.Type' access=internal non-resilient inherits: Protocol
    (constructor_decl implicit range=[Test.swift:2:8 - line:2:8] "init()" interface type='(Test.Type) -> () -> Test' access=internal designated
      (parameter "self" interface type='Test' inout)
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))))
"""
        let expectedGraphString = """
{
  "children" : [
    {
      "children" : [
        {
          "arcs" : [
            {
              "identifier" : "Protocol.Protocol",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "Protocol",
          "isRoot" : false,
          "scope" : "protocol",
          "tags" : [
            "Self : Protocol",
            "access=internal",
            "interface",
            "non-resilient",
            "requirement",
            "signature=<Self>"
          ]
        },
        {
          "arcs" : [
            {
              "identifier" : "Test.Type",
              "isRoot" : false,
              "scope" : "unknown"
            },
            {
              "identifier" : "Protocol",
              "isRoot" : false,
              "scope" : "protocol"
            }
          ],
          "children" : [
            {
              "arcs" : [
                {
                  "identifier" : "Test.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "identifier" : "Test.init().self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "inout",
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
              "identifier" : "Test.init()",
              "isRoot" : false,
              "scope" : "constructor_decl",
              "tags" : [
                "access=internal",
                "designated",
                "implicit",
                "interface"
              ]
            }
          ],
          "identifier" : "Test",
          "isRoot" : false,
          "scope" : "struct_decl",
          "tags" : [
            "access=internal",
            "interface",
            "non-resilient"
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
