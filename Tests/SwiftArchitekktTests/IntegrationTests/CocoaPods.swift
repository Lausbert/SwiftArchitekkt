//  Copyright © 2020 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTest {

    func testCocoaPodsForWorkspace() {
        testNodeRequestHandlingForRessourceFile(withName: "CocoaPods",
                                                 pathExtension: "xcworkspace",
                                                 options: ["scheme": "CocoaPods"],
                                                 lastProcedure: SwiftNodeRequestHandler.LastProcedure.generatingNode,
                                                 statusUpdateValidationHandler: { (_, additionalInformation, expectation) in
                                                    guard let additionalInformation = additionalInformation else {
                                                        XCTFail()
                                                        return
                                                    }
                                                    let nodeString = """
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
              "id" : "@@@",
              "scope" : "import_decl",
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
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
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
                      "id" : "@@@",
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
                          "id" : "@@@",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "@@@",
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
                      "id" : "@@@",
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
                      "id" : "@@@",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "TestClass.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=open",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "id" : "@@@",
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
                      "id" : "@@@",
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
                      "id" : "@@@",
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
                          "id" : "@@@",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "TestStruct.init()",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=public",
                    "designated",
                    "interface"
                  ]
                }
              ],
              "id" : "@@@",
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

              ],
              "children" : [

              ],
              "id" : "@@@",
              "name" : "TestProtocol",
              "scope" : "protocol",
              "tags" : [
                "access=public",
                "interface",
                "non-resilient",
                "requirement",
                "signature=<Self>"
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
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
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
                      "id" : "@@@",
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
                          "id" : "@@@",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "TestGenericClass.init()",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=public",
                    "captures=(<generic> )",
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
                      "id" : "@@@",
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
                      "id" : "@@@",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "TestGenericClass.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=open",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "id" : "@@@",
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
                      "id" : "@@@",
                      "name" : "TestEnum.test:@@@",
                      "scope" : "enum_element_decl",
                      "tags" : [
                        "access=public",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "scope" : "enum_case_decl",
                  "tags" : [

                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [

                  ],
                  "id" : "@@@",
                  "name" : "TestEnum.test:@@@",
                  "scope" : "enum_element_decl",
                  "tags" : [
                    "access=public",
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
                      "id" : "@@@",
                      "name" : "TestEnum.__derived_enum_equals(_:_:).self",
                      "scope" : "parameter",
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
                          "id" : "@@@",
                          "name" : "TestEnum.__derived_enum_equals(_:_:).a",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
                          "name" : "TestEnum.__derived_enum_equals(_:_:).b",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "id" : "@@@",
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
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "@@@",
                                  "scope" : "pattern_named",
                                  "tags" : [
                                    "implicit",
                                    "index_a"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "pattern_typed",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "pattern_binding_decl",
                          "tags" : [
                            "implicit"
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
                              "id" : "@@@",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=unapplied",
                                "implicit"
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
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "@@@",
                                      "scope" : "pattern_enum_element",
                                      "tags" : [
                                        "TestEnum._",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "case_label_item",
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
                                        {
                                          "arcs" : [

                                          ],
                                          "children" : [

                                          ],
                                          "id" : "@@@",
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        },
                                        {
                                          "arcs" : [

                                          ],
                                          "children" : [

                                          ],
                                          "id" : "@@@",
                                          "scope" : "integer_literal_expr",
                                          "tags" : [
                                            "implicit",
                                            "initializer=**NULL**",
                                            "value=0"
                                          ]
                                        }
                                      ],
                                      "id" : "@@@",
                                      "scope" : "assign_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "brace_stmt",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "case_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "switch_stmt",
                          "tags" : [
                            "implicit"
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
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "@@@",
                                  "scope" : "pattern_named",
                                  "tags" : [
                                    "implicit",
                                    "index_b"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "pattern_typed",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "pattern_binding_decl",
                          "tags" : [
                            "implicit"
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
                              "id" : "@@@",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=unapplied",
                                "implicit"
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
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "@@@",
                                      "scope" : "pattern_enum_element",
                                      "tags" : [
                                        "TestEnum._",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "case_label_item",
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
                                        {
                                          "arcs" : [

                                          ],
                                          "children" : [

                                          ],
                                          "id" : "@@@",
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        },
                                        {
                                          "arcs" : [

                                          ],
                                          "children" : [

                                          ],
                                          "id" : "@@@",
                                          "scope" : "integer_literal_expr",
                                          "tags" : [
                                            "implicit",
                                            "initializer=**NULL**",
                                            "value=0"
                                          ]
                                        }
                                      ],
                                      "id" : "@@@",
                                      "scope" : "assign_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "brace_stmt",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "case_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "switch_stmt",
                          "tags" : [
                            "implicit"
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
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "@@@",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "@@@",
                                      "scope" : "type_expr",
                                      "tags" : [
                                        "<<NULL>>",
                                        "implicit",
                                        "typerepr="
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "dot_syntax_call_expr",
                                  "tags" : [
                                    "implicit",
                                    "nothrow"
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
                                      "id" : "@@@",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "@@@",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "binary_expr",
                              "tags" : [
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "TestEnum.__derived_enum_equals(_:_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "access=public",
                    "implicit",
                    "interface",
                    "type"
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
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
                          "name" : "TestEnum.hashValue.self",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
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
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "@@@",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
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
                                          "id" : "@@@",
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        }
                                      ],
                                      "id" : "@@@",
                                      "scope" : "tuple_expr",
                                      "tags" : [
                                        "implicit",
                                        "names=for"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "call_expr",
                                  "tags" : [
                                    "arg_labels=for:",
                                    "implicit",
                                    "nothrow"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=public",
                        "get_for=hashValue",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "TestEnum.hashValue",
                  "scope" : "var_decl",
                  "tags" : [
                    "access=public",
                    "immutable",
                    "implicit",
                    "interface",
                    "readImpl=getter"
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
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
                          "scope" : "pattern_named",
                          "tags" : [
                            "hashValue",
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "pattern_typed",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "implicit"
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
                      "id" : "@@@",
                      "name" : "TestEnum.hash(into:).self",
                      "scope" : "parameter",
                      "tags" : [
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
                          "id" : "@@@",
                          "name" : "TestEnum.hash(into:).hasher",
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=into",
                            "inout",
                            "interface"
                          ]
                        }
                      ],
                      "id" : "@@@",
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
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "@@@",
                                  "scope" : "pattern_named",
                                  "tags" : [
                                    "discriminator",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "pattern_typed",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "pattern_binding_decl",
                          "tags" : [
                            "implicit"
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
                              "id" : "@@@",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=unapplied",
                                "implicit"
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
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "@@@",
                                      "scope" : "pattern_enum_element",
                                      "tags" : [
                                        "TestEnum._",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "case_label_item",
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
                                        {
                                          "arcs" : [

                                          ],
                                          "children" : [

                                          ],
                                          "id" : "@@@",
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        },
                                        {
                                          "arcs" : [

                                          ],
                                          "children" : [

                                          ],
                                          "id" : "@@@",
                                          "scope" : "integer_literal_expr",
                                          "tags" : [
                                            "implicit",
                                            "initializer=**NULL**",
                                            "value=0"
                                          ]
                                        }
                                      ],
                                      "id" : "@@@",
                                      "scope" : "assign_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "brace_stmt",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "case_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "switch_stmt",
                          "tags" : [
                            "implicit"
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
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "@@@",
                                  "scope" : "declref_expr",
                                  "tags" : [
                                    "function_ref=single",
                                    "implicit"
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
                                      "id" : "@@@",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "inout_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "dot_syntax_call_expr",
                              "tags" : [
                                "implicit",
                                "nothrow"
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
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "@@@",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "load_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "paren_expr",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "call_expr",
                          "tags" : [
                            "arg_labels=_:",
                            "implicit",
                            "nothrow"
                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "TestEnum.hash(into:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "access=public",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "id" : "@@@",
              "name" : "TestEnum",
              "scope" : "enum_decl",
              "tags" : [
                "access=public",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "id" : "@@@",
          "name" : "TestStuffSourceFile",
          "scope" : "source_file",
          "tags" : [

          ]
        }
      ],
      "id" : "@@@",
      "name" : "CocoaPod",
      "scope" : "module",
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
            {
              "arcs" : [

              ],
              "children" : [

              ],
              "id" : "@@@",
              "scope" : "import_decl",
              "tags" : [

              ]
            },
            {
              "arcs" : [
                "@@@"
              ],
              "children" : [

              ],
              "id" : "@@@",
              "scope" : "import_decl",
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
                    {
                      "arcs" : [
                        "@@@"
                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "scope" : "pattern_named",
                      "tags" : [
                        "testClass"
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
                                "@@@"
                              ],
                              "children" : [

                              ],
                              "id" : "@@@",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "arcs" : [
                                "@@@"
                              ],
                              "children" : [

                              ],
                              "id" : "@@@",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestClass",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
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
                                "@@@"
                              ],
                              "children" : [

                              ],
                              "id" : "@@@",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "arcs" : [
                                "@@@"
                              ],
                              "children" : [

                              ],
                              "id" : "@@@",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestClass",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Original",
                    "Processed",
                    "init:"
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
                          "id" : "@@@",
                          "name" : "AppDelegate.testClass.self",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
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
                                      "id" : "@@@",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=internal",
                        "get_for=testClass",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "AppDelegate.testClass",
                  "scope" : "var_decl",
                  "tags" : [
                    "access=internal",
                    "immutable",
                    "interface",
                    "let",
                    "readImpl=stored"
                  ]
                },
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
                      "id" : "@@@",
                      "scope" : "pattern_named",
                      "tags" : [
                        "testStruct"
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
                                "@@@"
                              ],
                              "children" : [

                              ],
                              "id" : "@@@",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "arcs" : [
                                "@@@"
                              ],
                              "children" : [

                              ],
                              "id" : "@@@",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestStruct",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
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
                                "@@@"
                              ],
                              "children" : [

                              ],
                              "id" : "@@@",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "arcs" : [
                                "@@@"
                              ],
                              "children" : [

                              ],
                              "id" : "@@@",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestStruct",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Original",
                    "Processed",
                    "init:"
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
                          "id" : "@@@",
                          "name" : "AppDelegate.testStruct.self",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
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
                                      "id" : "@@@",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=internal",
                        "get_for=testStruct",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "AppDelegate.testStruct",
                  "scope" : "var_decl",
                  "tags" : [
                    "access=internal",
                    "immutable",
                    "interface",
                    "let",
                    "readImpl=stored"
                  ]
                },
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
                      "id" : "@@@",
                      "scope" : "pattern_named",
                      "tags" : [
                        "testEnum"
                      ]
                    },
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
                          "id" : "@@@",
                          "scope" : "type_expr",
                          "tags" : [
                            "TestEnum",
                            "typerepr="
                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "unresolved_dot_expr",
                      "tags" : [
                        "field",
                        "function_ref=unapplied",
                        "test"
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

                          ],
                          "id" : "@@@",
                          "scope" : "declref_expr",
                          "tags" : [
                            "function_ref=unapplied"
                          ]
                        },
                        {
                          "arcs" : [
                            "@@@"
                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
                          "scope" : "type_expr",
                          "tags" : [
                            "TestEnum",
                            "typerepr="
                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "dot_syntax_call_expr",
                      "tags" : [
                        "nothrow"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Original",
                    "Processed",
                    "init:"
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
                          "id" : "@@@",
                          "name" : "AppDelegate.testEnum.self",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
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
                                      "id" : "@@@",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=internal",
                        "get_for=testEnum",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "AppDelegate.testEnum",
                  "scope" : "var_decl",
                  "tags" : [
                    "access=internal",
                    "immutable",
                    "interface",
                    "let",
                    "readImpl=stored"
                  ]
                },
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
                      "id" : "@@@",
                      "scope" : "pattern_named",
                      "tags" : [
                        "testGenericClass"
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
                                "@@@"
                              ],
                              "children" : [

                              ],
                              "id" : "@@@",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "arcs" : [
                                "@@@"
                              ],
                              "children" : [

                              ],
                              "id" : "@@@",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestGenericClass<String>",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
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
                                "@@@"
                              ],
                              "children" : [

                              ],
                              "id" : "@@@",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "arcs" : [
                                "@@@"
                              ],
                              "children" : [

                              ],
                              "id" : "@@@",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestGenericClass<String>",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Original",
                    "Processed",
                    "init:"
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
                          "id" : "@@@",
                          "name" : "AppDelegate.testGenericClass.self",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
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
                                      "id" : "@@@",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=internal",
                        "get_for=testGenericClass",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "AppDelegate.testGenericClass",
                  "scope" : "var_decl",
                  "tags" : [
                    "access=internal",
                    "immutable",
                    "interface",
                    "let",
                    "readImpl=stored"
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
                      "id" : "@@@",
                      "name" : "AppDelegate.deinit.self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "AppDelegate.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=internal",
                    "implicit",
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
                      "id" : "@@@",
                      "name" : "AppDelegate.init().self",
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
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
                                      "id" : "@@@",
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "@@@",
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "dot_syntax_call_expr",
                                  "tags" : [
                                    "implicit",
                                    "nothrow",
                                    "super"
                                  ]
                                },
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "@@@",
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "rebind_self_in_constructor_expr",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "AppDelegate.init()",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "designated",
                    "dynamic",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "id" : "@@@",
              "name" : "AppDelegate",
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
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

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "name" : "TestChildClass.deinit.self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "TestChildClass.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=internal",
                    "implicit",
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
                      "id" : "@@@",
                      "name" : "TestChildClass.init().self",
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
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
                                        "@@@"
                                      ],
                                      "children" : [

                                      ],
                                      "id" : "@@@",
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [
                                        "@@@"
                                      ],
                                      "children" : [

                                      ],
                                      "id" : "@@@",
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "dot_syntax_call_expr",
                                  "tags" : [
                                    "implicit",
                                    "nothrow",
                                    "super"
                                  ]
                                },
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "@@@",
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "rebind_self_in_constructor_expr",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "TestChildClass.init()",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=internal",
                    "designated",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "id" : "@@@",
              "name" : "TestChildClass",
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
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

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "name" : "TestGenericChildClass.deinit.self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "TestGenericChildClass.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=internal",
                    "implicit",
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
                      "id" : "@@@",
                      "name" : "TestGenericChildClass.init().self",
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
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
                                        "@@@"
                                      ],
                                      "children" : [

                                      ],
                                      "id" : "@@@",
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [
                                        "@@@"
                                      ],
                                      "children" : [

                                      ],
                                      "id" : "@@@",
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "@@@",
                                  "scope" : "dot_syntax_call_expr",
                                  "tags" : [
                                    "implicit",
                                    "nothrow",
                                    "super"
                                  ]
                                },
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "@@@",
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "rebind_self_in_constructor_expr",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "TestGenericChildClass.init()",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=internal",
                    "designated",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "id" : "@@@",
              "name" : "TestGenericChildClass",
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "id" : "@@@",
          "name" : "AppDelegateSourceFile",
          "scope" : "source_file",
          "tags" : [

          ]
        }
      ],
      "id" : "@@@",
      "name" : "CocoaPods",
      "scope" : "module",
      "tags" : [

      ]
    }
  ],
  "id" : "@@@",
  "scope" : "root",
  "tags" : [

  ]
}
"""
                                                    XCTStringMatchesPattern(string: additionalInformation, pattern: nodeString)
                                                    expectation.fulfill()
        })
    }
}
