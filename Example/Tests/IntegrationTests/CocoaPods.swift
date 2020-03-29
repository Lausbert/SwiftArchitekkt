//  Copyright © 2020 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTest {

    func testCocoaPodsForWorkspace() {
        testGraphRequestHandlingForRessourceFile(withName: "CocoaPods",
                                                 pathExtension: "xcworkspace",
                                                 options: ["scheme": "CocoaPods"],
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.generatingGraph,
                                                 statusUpdateValidationHandler: { (_, additionalInformation, expectation) in
                                                    guard let additionalInformation = additionalInformation else {
                                                        XCTFail()
                                                        return
                                                    }
                                                    let graphString = """
{
  "children" : [
    {
      "children" : [
        {
          "children" : [
            {
              "isRoot" : false,
              "scope" : "import_decl",
              "tags" : [
                "Foundation"
              ]
            },
            {
              "children" : [
                {
                  "children" : [
                    {
                      "identifier" : "TestClass.init().self",
                      "isRoot" : false,
                      "scope" : "parameter"
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
                      "scope" : "brace_stmt"
                    }
                  ],
                  "identifier" : "TestClass.init()",
                  "isRoot" : false,
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=public",
                    "designated",
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "TestClass.deinit.self",
                      "isRoot" : false,
                      "scope" : "parameter"
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
                  "identifier" : "TestClass.deinit",
                  "isRoot" : false,
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=open",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "identifier" : "TestClass",
              "isRoot" : false,
              "scope" : "class_decl",
              "tags" : [
                "access=open",
                "interface",
                "non-resilient"
              ]
            },
            {
              "children" : [
                {
                  "children" : [
                    {
                      "identifier" : "TestStruct.init().self",
                      "isRoot" : false,
                      "scope" : "parameter"
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
                      "scope" : "brace_stmt"
                    }
                  ],
                  "identifier" : "TestStruct.init()",
                  "isRoot" : false,
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=public",
                    "designated",
                    "interface"
                  ]
                }
              ],
              "identifier" : "TestStruct",
              "isRoot" : false,
              "scope" : "struct_decl",
              "tags" : [
                "access=public",
                "interface",
                "non-resilient"
              ]
            },
            {
              "identifier" : "TestProtocol",
              "isRoot" : false,
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
              "children" : [
                {
                  "children" : [
                    {
                      "identifier" : "TestGenericClass.init().self",
                      "isRoot" : false,
                      "scope" : "parameter"
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
                      "scope" : "brace_stmt"
                    }
                  ],
                  "identifier" : "TestGenericClass.init()",
                  "isRoot" : false,
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=public",
                    "designated",
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "TestGenericClass.deinit.self",
                      "isRoot" : false,
                      "scope" : "parameter"
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
                  "identifier" : "TestGenericClass.deinit",
                  "isRoot" : false,
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=open",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "identifier" : "TestGenericClass",
              "isRoot" : false,
              "scope" : "class_decl",
              "tags" : [
                "T",
                "access=open",
                "interface",
                "non-resilient"
              ]
            },
            {
              "children" : [
                {
                  "children" : [
                    {
                      "identifier" : "TestEnum.test:@@@",
                      "isRoot" : false,
                      "scope" : "enum_element_decl",
                      "tags" : [
                        "access=public",
                        "interface"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "enum_case_decl"
                },
                {
                  "identifier" : "TestEnum.test:@@@",
                  "isRoot" : false,
                  "scope" : "enum_element_decl",
                  "tags" : [
                    "access=public",
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "TestEnum.__derived_enum_equals(_:_:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "TestEnum.__derived_enum_equals(_:_:).a",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "identifier" : "TestEnum.__derived_enum_equals(_:_:).b",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "parameter_list"
                    },
                    {
                      "children" : [
                        {
                          "children" : [
                            {
                              "children" : [
                                {
                                  "isRoot" : false,
                                  "scope" : "pattern_named",
                                  "tags" : [
                                    "implicit",
                                    "index_a"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "pattern_typed",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "pattern_binding_decl",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "children" : [
                            {
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=unapplied",
                                "implicit"
                              ]
                            },
                            {
                              "children" : [
                                {
                                  "children" : [
                                    {
                                      "isRoot" : false,
                                      "scope" : "pattern_enum_element",
                                      "tags" : [
                                        "TestEnum._",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "case_label_item"
                                },
                                {
                                  "children" : [
                                    {
                                      "children" : [
                                        {
                                          "isRoot" : false,
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        },
                                        {
                                          "isRoot" : false,
                                          "scope" : "integer_literal_expr",
                                          "tags" : [
                                            "implicit",
                                            "initializer=**NULL**",
                                            "value=0"
                                          ]
                                        }
                                      ],
                                      "isRoot" : false,
                                      "scope" : "assign_expr",
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
                              "isRoot" : false,
                              "scope" : "case_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "switch_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "children" : [
                            {
                              "children" : [
                                {
                                  "isRoot" : false,
                                  "scope" : "pattern_named",
                                  "tags" : [
                                    "implicit",
                                    "index_b"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "pattern_typed",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "pattern_binding_decl",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "children" : [
                            {
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=unapplied",
                                "implicit"
                              ]
                            },
                            {
                              "children" : [
                                {
                                  "children" : [
                                    {
                                      "isRoot" : false,
                                      "scope" : "pattern_enum_element",
                                      "tags" : [
                                        "TestEnum._",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "case_label_item"
                                },
                                {
                                  "children" : [
                                    {
                                      "children" : [
                                        {
                                          "isRoot" : false,
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        },
                                        {
                                          "isRoot" : false,
                                          "scope" : "integer_literal_expr",
                                          "tags" : [
                                            "implicit",
                                            "initializer=**NULL**",
                                            "value=0"
                                          ]
                                        }
                                      ],
                                      "isRoot" : false,
                                      "scope" : "assign_expr",
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
                              "isRoot" : false,
                              "scope" : "case_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "switch_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "children" : [
                            {
                              "children" : [
                                {
                                  "children" : [
                                    {
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "isRoot" : false,
                                      "scope" : "type_expr",
                                      "tags" : [
                                        "<<NULL>>",
                                        "implicit",
                                        "typerepr="
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "dot_syntax_call_expr",
                                  "tags" : [
                                    "implicit",
                                    "nothrow"
                                  ]
                                },
                                {
                                  "children" : [
                                    {
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "binary_expr",
                              "tags" : [
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
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
                  "identifier" : "TestEnum.__derived_enum_equals(_:_:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "access=public",
                    "implicit",
                    "interface",
                    "type"
                  ]
                },
                {
                  "children" : [
                    {
                      "children" : [
                        {
                          "identifier" : "TestEnum.hashValue.self",
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
                              "children" : [
                                {
                                  "children" : [
                                    {
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "children" : [
                                        {
                                          "isRoot" : false,
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        }
                                      ],
                                      "isRoot" : false,
                                      "scope" : "tuple_expr",
                                      "tags" : [
                                        "implicit",
                                        "names=for"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "call_expr",
                                  "tags" : [
                                    "arg_labels=for:",
                                    "implicit",
                                    "nothrow"
                                  ]
                                }
                              ],
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
                      "isRoot" : false,
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=public",
                        "get_for=hashValue",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "identifier" : "TestEnum.hashValue",
                  "isRoot" : false,
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
                  "children" : [
                    {
                      "children" : [
                        {
                          "isRoot" : false,
                          "scope" : "pattern_named",
                          "tags" : [
                            "hashValue",
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "pattern_typed",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "implicit"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "TestEnum.hash(into:).self",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "TestEnum.hash(into:).hasher",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=into",
                            "inout",
                            "interface"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "parameter_list"
                    },
                    {
                      "children" : [
                        {
                          "children" : [
                            {
                              "children" : [
                                {
                                  "isRoot" : false,
                                  "scope" : "pattern_named",
                                  "tags" : [
                                    "discriminator",
                                    "implicit"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "pattern_typed",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "pattern_binding_decl",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "children" : [
                            {
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=unapplied",
                                "implicit"
                              ]
                            },
                            {
                              "children" : [
                                {
                                  "children" : [
                                    {
                                      "isRoot" : false,
                                      "scope" : "pattern_enum_element",
                                      "tags" : [
                                        "TestEnum._",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "case_label_item"
                                },
                                {
                                  "children" : [
                                    {
                                      "children" : [
                                        {
                                          "isRoot" : false,
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        },
                                        {
                                          "isRoot" : false,
                                          "scope" : "integer_literal_expr",
                                          "tags" : [
                                            "implicit",
                                            "initializer=**NULL**",
                                            "value=0"
                                          ]
                                        }
                                      ],
                                      "isRoot" : false,
                                      "scope" : "assign_expr",
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
                              "isRoot" : false,
                              "scope" : "case_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "switch_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "children" : [
                            {
                              "children" : [
                                {
                                  "isRoot" : false,
                                  "scope" : "declref_expr",
                                  "tags" : [
                                    "function_ref=single",
                                    "implicit"
                                  ]
                                },
                                {
                                  "children" : [
                                    {
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "inout_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "dot_syntax_call_expr",
                              "tags" : [
                                "implicit",
                                "nothrow"
                              ]
                            },
                            {
                              "children" : [
                                {
                                  "children" : [
                                    {
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "load_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "paren_expr",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "call_expr",
                          "tags" : [
                            "arg_labels=_:",
                            "implicit",
                            "nothrow"
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
                  "identifier" : "TestEnum.hash(into:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "access=public",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "identifier" : "TestEnum",
              "isRoot" : false,
              "scope" : "enum_decl",
              "tags" : [
                "access=public",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "identifier" : "TestStuffSourceFile",
          "isRoot" : false,
          "scope" : "source_file"
        }
      ],
      "identifier" : "CocoaPod",
      "isRoot" : false,
      "scope" : "module"
    },
    {
      "children" : [
        {
          "children" : [
            {
              "isRoot" : false,
              "scope" : "import_decl",
              "tags" : [
                "UIKit"
              ]
            },
            {
              "isRoot" : false,
              "scope" : "import_decl",
              "tags" : [
                "CocoaPod"
              ]
            },
            {
              "children" : [
                {
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "TestClass",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "pattern_named",
                      "tags" : [
                        "testClass"
                      ]
                    },
                    {
                      "arcs" : [
                        {
                          "identifier" : "TestClass",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "TestClass",
                              "isRoot" : false,
                              "scope" : "class_decl"
                            }
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "TestClass",
                                  "isRoot" : false,
                                  "scope" : "class_decl"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "isRoot" : false,
                              "scope" : "type_expr",
                              "tags" : [
                                "TestClass",
                                "typerepr="
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "isRoot" : false,
                          "scope" : "tuple_expr"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    },
                    {
                      "arcs" : [
                        {
                          "identifier" : "TestClass",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "TestClass",
                              "isRoot" : false,
                              "scope" : "class_decl"
                            }
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "TestClass",
                                  "isRoot" : false,
                                  "scope" : "class_decl"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "isRoot" : false,
                              "scope" : "type_expr",
                              "tags" : [
                                "TestClass",
                                "typerepr="
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "isRoot" : false,
                          "scope" : "tuple_expr"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Original",
                    "Processed",
                    "init:"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "TestClass",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "TestClass",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "children" : [
                        {
                          "identifier" : "AppDelegate.testClass.self",
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
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "TestClass",
                                      "isRoot" : false,
                                      "scope" : "class_decl"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
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
                      "isRoot" : false,
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=internal",
                        "final",
                        "get_for=testClass",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "identifier" : "AppDelegate.testClass",
                  "isRoot" : false,
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
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "TestStruct",
                          "isRoot" : false,
                          "scope" : "struct_decl"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "pattern_named",
                      "tags" : [
                        "testStruct"
                      ]
                    },
                    {
                      "arcs" : [
                        {
                          "identifier" : "TestStruct",
                          "isRoot" : false,
                          "scope" : "struct_decl"
                        }
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "TestStruct",
                              "isRoot" : false,
                              "scope" : "struct_decl"
                            }
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "TestStruct",
                                  "isRoot" : false,
                                  "scope" : "struct_decl"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "isRoot" : false,
                              "scope" : "type_expr",
                              "tags" : [
                                "TestStruct",
                                "typerepr="
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "isRoot" : false,
                          "scope" : "tuple_expr"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    },
                    {
                      "arcs" : [
                        {
                          "identifier" : "TestStruct",
                          "isRoot" : false,
                          "scope" : "struct_decl"
                        }
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "TestStruct",
                              "isRoot" : false,
                              "scope" : "struct_decl"
                            }
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "TestStruct",
                                  "isRoot" : false,
                                  "scope" : "struct_decl"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "isRoot" : false,
                              "scope" : "type_expr",
                              "tags" : [
                                "TestStruct",
                                "typerepr="
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "isRoot" : false,
                          "scope" : "tuple_expr"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Original",
                    "Processed",
                    "init:"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "TestStruct",
                      "isRoot" : false,
                      "scope" : "struct_decl"
                    }
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "TestStruct",
                          "isRoot" : false,
                          "scope" : "struct_decl"
                        }
                      ],
                      "children" : [
                        {
                          "identifier" : "AppDelegate.testStruct.self",
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
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "TestStruct",
                                      "isRoot" : false,
                                      "scope" : "struct_decl"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
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
                      "isRoot" : false,
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=internal",
                        "final",
                        "get_for=testStruct",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "identifier" : "AppDelegate.testStruct",
                  "isRoot" : false,
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
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "TestEnum",
                          "isRoot" : false,
                          "scope" : "enum_decl"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "pattern_named",
                      "tags" : [
                        "testEnum"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "isRoot" : false,
                          "scope" : "type_expr",
                          "tags" : [
                            "TestEnum",
                            "typerepr="
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "unresolved_dot_expr",
                      "tags" : [
                        "field",
                        "function_ref=unapplied",
                        "test"
                      ]
                    },
                    {
                      "arcs" : [
                        {
                          "identifier" : "TestEnum",
                          "isRoot" : false,
                          "scope" : "enum_decl"
                        }
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "TestEnum",
                              "isRoot" : false,
                              "scope" : "enum_decl"
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "declref_expr",
                          "tags" : [
                            "function_ref=unapplied"
                          ]
                        },
                        {
                          "isRoot" : false,
                          "scope" : "type_expr",
                          "tags" : [
                            "TestEnum",
                            "typerepr="
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "dot_syntax_call_expr",
                      "tags" : [
                        "nothrow"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Original",
                    "Processed",
                    "init:"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "TestEnum",
                      "isRoot" : false,
                      "scope" : "enum_decl"
                    }
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "TestEnum",
                          "isRoot" : false,
                          "scope" : "enum_decl"
                        }
                      ],
                      "children" : [
                        {
                          "identifier" : "AppDelegate.testEnum.self",
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
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "TestEnum",
                                      "isRoot" : false,
                                      "scope" : "enum_decl"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
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
                      "isRoot" : false,
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=internal",
                        "final",
                        "get_for=testEnum",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "identifier" : "AppDelegate.testEnum",
                  "isRoot" : false,
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
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "TestGenericClass",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "pattern_named",
                      "tags" : [
                        "testGenericClass"
                      ]
                    },
                    {
                      "arcs" : [
                        {
                          "identifier" : "TestGenericClass",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "TestGenericClass",
                              "isRoot" : false,
                              "scope" : "class_decl"
                            }
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "TestGenericClass",
                                  "isRoot" : false,
                                  "scope" : "class_decl"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "isRoot" : false,
                              "scope" : "type_expr",
                              "tags" : [
                                "TestGenericClass<String>",
                                "typerepr="
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "isRoot" : false,
                          "scope" : "tuple_expr"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    },
                    {
                      "arcs" : [
                        {
                          "identifier" : "TestGenericClass",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "TestGenericClass",
                              "isRoot" : false,
                              "scope" : "class_decl"
                            }
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "TestGenericClass",
                                  "isRoot" : false,
                                  "scope" : "class_decl"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "isRoot" : false,
                              "scope" : "type_expr",
                              "tags" : [
                                "TestGenericClass<String>",
                                "typerepr="
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "isRoot" : false,
                          "scope" : "tuple_expr"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Original",
                    "Processed",
                    "init:"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "TestGenericClass",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "TestGenericClass",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "children" : [
                        {
                          "identifier" : "AppDelegate.testGenericClass.self",
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
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "TestGenericClass",
                                      "isRoot" : false,
                                      "scope" : "class_decl"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
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
                      "isRoot" : false,
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=internal",
                        "final",
                        "get_for=testGenericClass",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "identifier" : "AppDelegate.testGenericClass",
                  "isRoot" : false,
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
                  "children" : [
                    {
                      "identifier" : "AppDelegate.deinit.self",
                      "isRoot" : false,
                      "scope" : "parameter"
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
                  "identifier" : "AppDelegate.deinit",
                  "isRoot" : false,
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=internal",
                    "implicit",
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "AppDelegate.init().self",
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
                          "children" : [
                            {
                              "children" : [
                                {
                                  "children" : [
                                    {
                                      "isRoot" : false,
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "isRoot" : false,
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "dot_syntax_call_expr",
                                  "tags" : [
                                    "implicit",
                                    "nothrow",
                                    "super"
                                  ]
                                },
                                {
                                  "isRoot" : false,
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "rebind_self_in_constructor_expr",
                          "tags" : [
                            "implicit"
                          ]
                        },
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
                  "identifier" : "AppDelegate.init()",
                  "isRoot" : false,
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
              "identifier" : "AppDelegate",
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
                  "identifier" : "TestClass",
                  "isRoot" : false,
                  "scope" : "class_decl"
                },
                {
                  "identifier" : "TestProtocol",
                  "isRoot" : false,
                  "scope" : "protocol"
                }
              ],
              "children" : [
                {
                  "children" : [
                    {
                      "identifier" : "TestChildClass.deinit.self",
                      "isRoot" : false,
                      "scope" : "parameter"
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
                  "identifier" : "TestChildClass.deinit",
                  "isRoot" : false,
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=internal",
                    "implicit",
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "TestChildClass.init().self",
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
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "TestClass",
                                  "isRoot" : false,
                                  "scope" : "class_decl"
                                }
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "TestClass",
                                      "isRoot" : false,
                                      "scope" : "class_decl"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        {
                                          "identifier" : "TestClass",
                                          "isRoot" : false,
                                          "scope" : "class_decl"
                                        }
                                      ],
                                      "isRoot" : false,
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [
                                        {
                                          "identifier" : "TestClass",
                                          "isRoot" : false,
                                          "scope" : "class_decl"
                                        }
                                      ],
                                      "isRoot" : false,
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "dot_syntax_call_expr",
                                  "tags" : [
                                    "implicit",
                                    "nothrow",
                                    "super"
                                  ]
                                },
                                {
                                  "isRoot" : false,
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "rebind_self_in_constructor_expr",
                          "tags" : [
                            "implicit"
                          ]
                        },
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
                  "identifier" : "TestChildClass.init()",
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
              "identifier" : "TestChildClass",
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
                  "identifier" : "TestProtocol",
                  "isRoot" : false,
                  "scope" : "protocol"
                }
              ],
              "children" : [
                {
                  "children" : [
                    {
                      "identifier" : "TestGenericChildClass.deinit.self",
                      "isRoot" : false,
                      "scope" : "parameter"
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
                  "identifier" : "TestGenericChildClass.deinit",
                  "isRoot" : false,
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=internal",
                    "implicit",
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "TestGenericChildClass.init().self",
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
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "TestGenericClass",
                                  "isRoot" : false,
                                  "scope" : "class_decl"
                                }
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "TestGenericClass",
                                      "isRoot" : false,
                                      "scope" : "class_decl"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        {
                                          "identifier" : "TestGenericClass",
                                          "isRoot" : false,
                                          "scope" : "class_decl"
                                        }
                                      ],
                                      "isRoot" : false,
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [
                                        {
                                          "identifier" : "TestGenericClass",
                                          "isRoot" : false,
                                          "scope" : "class_decl"
                                        }
                                      ],
                                      "isRoot" : false,
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "dot_syntax_call_expr",
                                  "tags" : [
                                    "implicit",
                                    "nothrow",
                                    "super"
                                  ]
                                },
                                {
                                  "isRoot" : false,
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "rebind_self_in_constructor_expr",
                          "tags" : [
                            "implicit"
                          ]
                        },
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
                  "identifier" : "TestGenericChildClass.init()",
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
              "identifier" : "TestGenericChildClass",
              "isRoot" : false,
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "identifier" : "AppDelegateSourceFile",
          "isRoot" : false,
          "scope" : "source_file"
        }
      ],
      "identifier" : "CocoaPods",
      "isRoot" : false,
      "scope" : "module"
    }
  ],
  "isRoot" : true,
  "scope" : "root"
}
"""
                                                    XCTStringMatchesPattern(string: additionalInformation, pattern: graphString)
                                                    expectation.fulfill()
        })
    }
}
