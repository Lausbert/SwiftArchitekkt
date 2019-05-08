//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension GraphBuilderTests {

    func testGraphBuilderForSingleActiveBranch() {
//            #if macOS // macOS is active
//            struct Active {}
//            #endif
        let ast = """
(source_file "test.swift"
  (if_config_decl range=[test.swift:1:1 - line:3:1]
    #if: active
      (unresolved_decl_ref_expr type='<null>' name=macOS function_ref=unapplied)
      (elements
        (struct_decl range=[test.swift:2:1 - line:2:16] "Active" interface type='Active.Type' access=internal non-resilient
          (constructor_decl implicit range=[test.swift:2:8 - line:2:8] "init()" interface type='(Active.Type) -> () -> Active' access=internal designated
            (parameter "self" interface type='Active' inout)
            (parameter_list)
            (brace_stmt implicit
              (return_stmt implicit))))))
  (struct_decl range=[test.swift:2:1 - line:2:16] "Active" interface type='Active.Type' access=internal non-resilient
    (constructor_decl implicit range=[test.swift:2:8 - line:2:8] "init()" interface type='(Active.Type) -> () -> Active' access=internal designated
      (parameter "self" interface type='Active' inout)
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))))
"""
        let expectedGraphString = """
{
  "children" : [
    {
      "identifier" : "Active.Type",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "arcs" : [
            {
              "identifier" : "Active.Type",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "children" : [
            {
              "arcs" : [
                {
                  "identifier" : "Active.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "identifier" : "Active.init().self",
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
              "identifier" : "Active.init()",
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
          "identifier" : "Active",
          "isRoot" : false,
          "scope" : "struct_decl",
          "tags" : [
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
  "isRoot" : true,
  "scope" : "root"
}
"""
        testGraphBuilderFor(ast: ast, expectedGraphString: expectedGraphString)
    }

    func testGraphBuilderForSingleInactiveBranch() {
        //    #if macOS // macOS is inactive
        //    struct Active {}
        //    #endif
        let ast = """
(source_file "test.swift"
  (if_config_decl range=[test.swift:1:1 - line:3:1]
    #if:
      (unresolved_decl_ref_expr type='<null>' name=macOS function_ref=unapplied)
      (elements
        (struct_decl range=[test.swift:2:1 - line:2:16] "Active"))))
"""
        let expectedGraphString = """
{
  "children" : [
    {
      "identifier" : "testSourceFile",
      "isRoot" : false,
      "scope" : "source_file"
    }
  ],
  "isRoot" : true,
  "scope" : "root"
}
"""
        testGraphBuilderFor(ast: ast, expectedGraphString: expectedGraphString)
    }

    func testGraphBuilderForTwoBranchesWhereIfBranchIsActive() {
//        #if macOS // macOs is active
//        struct Active {}
//        #else
//        struct other {}
//        #endif
        let ast = """
(source_file "test.swift"
  (if_config_decl range=[test.swift:1:1 - line:5:1]
    #if: active
      (unresolved_decl_ref_expr type='<null>' name=macOS function_ref=unapplied)
      (elements
        (struct_decl range=[test.swift:2:1 - line:2:16] "Active" interface type='Active.Type' access=internal non-resilient
          (constructor_decl implicit range=[test.swift:2:8 - line:2:8] "init()" interface type='(Active.Type) -> () -> Active' access=internal designated
            (parameter "self" interface type='Active' inout)
            (parameter_list)
            (brace_stmt implicit
              (return_stmt implicit)))))
    #else:
      (elements
        (struct_decl range=[test.swift:4:1 - line:4:15] "other")))
  (struct_decl range=[test.swift:2:1 - line:2:16] "Active" interface type='Active.Type' access=internal non-resilient
    (constructor_decl implicit range=[test.swift:2:8 - line:2:8] "init()" interface type='(Active.Type) -> () -> Active' access=internal designated
      (parameter "self" interface type='Active' inout)
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))))
"""
        let expectedGraphString = """
{
  "children" : [
    {
      "identifier" : "Active.Type",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "arcs" : [
            {
              "identifier" : "Active.Type",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "children" : [
            {
              "arcs" : [
                {
                  "identifier" : "Active.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "identifier" : "Active.init().self",
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
              "identifier" : "Active.init()",
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
          "identifier" : "Active",
          "isRoot" : false,
          "scope" : "struct_decl",
          "tags" : [
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
  "isRoot" : true,
  "scope" : "root"
}
"""
        testGraphBuilderFor(ast: ast, expectedGraphString: expectedGraphString)
    }

    func testGraphBuilderForTwoBranchesWhereElseBranchIsActive() {
//        #if macOS // macOs is inactive
//        struct Active {}
//        #else
//        struct other {}
//        #endif
        let ast = """
(source_file "test.swift"
  (if_config_decl range=[test.swift:1:1 - line:5:1]
    #if:
      (unresolved_decl_ref_expr type='<null>' name=macOS function_ref=unapplied)
      (elements
        (struct_decl range=[test.swift:2:1 - line:2:16] "Active"))
    #else: active
      (elements
        (struct_decl range=[test.swift:4:1 - line:4:15] "Other" interface type='Other.Type' access=internal non-resilient
          (constructor_decl implicit range=[test.swift:4:8 - line:4:8] "init()" interface type='(Other.Type) -> () -> Other' access=internal designated
            (parameter "self" interface type='Other' inout)
            (parameter_list)
            (brace_stmt implicit
              (return_stmt implicit))))))
  (struct_decl range=[test.swift:4:1 - line:4:15] "Other" interface type='Other.Type' access=internal non-resilient
    (constructor_decl implicit range=[test.swift:4:8 - line:4:8] "init()" interface type='(Other.Type) -> () -> Other' access=internal designated
      (parameter "self" interface type='Other' inout)
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))))
"""
        let expectedGraphString = """
{
  "children" : [
    {
      "identifier" : "Other.Type",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "arcs" : [
            {
              "identifier" : "Other.Type",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "children" : [
            {
              "arcs" : [
                {
                  "identifier" : "Other.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "identifier" : "Other.init().self",
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
              "identifier" : "Other.init()",
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
          "identifier" : "Other",
          "isRoot" : false,
          "scope" : "struct_decl",
          "tags" : [
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
  "isRoot" : true,
  "scope" : "root"
}
"""
        testGraphBuilderFor(ast: ast, expectedGraphString: expectedGraphString)
    }

}
