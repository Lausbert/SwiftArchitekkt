//  Copyright © 2020 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTest {

    func testPackageManagerForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "PackageManager",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme": "PackageManager"],
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.generatingGraph,
                                                 statusUpdateValidationHandler: { (_, additionalInformation, expectation) in
                                                    guard let additionalInformation = additionalInformation else {
                                                        XCTFail()
                                                        return
                                                    }
                                                    let graphString = """
{
  "arcs" : [

  ],
  "children" : [
    {
      "arcs" : [

      ],
      "children" : [
        {
          "arcs" : [

          ],
          "children" : [
            {
              "arcs" : [

              ],
              "children" : [

              ],
              "identifier" : "@@@",
              "isRoot" : false,
              "scope" : "import_decl",
              "tags" : [
                "Foundation"
              ]
            },
            {
              "arcs" : [
                "@@@"
              ],
              "children" : [
                {
                  "arcs" : [
                    "@@@"
                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "name" : "TestClass.init().self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
                  "name" : "TestClass.init()",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=public",
                    "designated",
                    "interface"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "name" : "TestClass.deinit.self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
                  "name" : "TestClass.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=open",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "identifier" : "@@@",
              "isRoot" : false,
              "name" : "TestClass",
              "scope" : "class_decl",
              "tags" : [
                "access=open",
                "interface",
                "non-resilient"
              ]
            },
            {
              "arcs" : [
                "@@@"
              ],
              "children" : [
                {
                  "arcs" : [
                    "@@@"
                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "name" : "TestStruct.init().self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
                  "name" : "TestStruct.init()",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=public",
                    "designated",
                    "interface"
                  ]
                }
              ],
              "identifier" : "@@@",
              "isRoot" : false,
              "name" : "TestStruct",
              "scope" : "struct_decl",
              "tags" : [
                "access=public",
                "interface",
                "non-resilient"
              ]
            },
            {
              "arcs" : [
                "@@@"
              ],
              "children" : [

              ],
              "identifier" : "@@@",
              "isRoot" : false,
              "name" : "TestProtocol",
              "scope" : "protocol",
              "tags" : [
                "Self : TestProtocol",
                "access=public",
                "interface",
                "non-resilient",
                "requirement",
                "signature=<Self>"
              ]
            },
            {
              "arcs" : [
                "@@@",
                "@@@"
              ],
              "children" : [
                {
                  "arcs" : [
                    "@@@",
                    "@@@"
                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "name" : "TestGenericClass.init().self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
                  "name" : "TestGenericClass.init()",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=public",
                    "designated",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    "@@@"
                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "name" : "TestGenericClass.deinit.self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
                  "name" : "TestGenericClass.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=open",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "identifier" : "@@@",
              "isRoot" : false,
              "name" : "TestGenericClass",
              "scope" : "class_decl",
              "tags" : [
                "T",
                "access=open",
                "interface",
                "non-resilient"
              ]
            },
            {
              "arcs" : [
                "@@@"
              ],
              "children" : [
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "@@@"
                      ],
                      "children" : [

                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "name" : "TestEnum.test:@@@",
                      "scope" : "enum_element_decl",
                      "tags" : [
                        "access=public",
                        "interface"
                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
                  "scope" : "enum_case_decl",
                  "tags" : [

                  ]
                },
                {
                  "arcs" : [
                    "@@@"
                  ],
                  "children" : [

                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
                  "name" : "TestEnum.test:@@@",
                  "scope" : "enum_element_decl",
                  "tags" : [
                    "access=public",
@@@
""" // avoid out of memory exception
                                                    XCTStringMatchesPattern(string: additionalInformation, pattern: graphString)
                                                    expectation.fulfill()
        })
    }
}
