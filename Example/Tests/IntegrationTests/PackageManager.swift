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
  "children" : [
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
                      "scope" : "pattern_named",
                      "tags" : [
                        "text"
                      ]
                    },
                    {
                      "isRoot" : false,
                      "scope" : "string_literal_expr",
                      "tags" : [
                        "encoding=utf8",
                        "initializer=**NULL**",
                        "value=Hello, World!"
                      ]
                    },
                    {
                      "isRoot" : false,
                      "scope" : "string_literal_expr",
                      "tags" : [
                        "encoding=utf8",
                        "initializer=**NULL**",
                        "value=Hello, World!"
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
                  "children" : [
                    {
                      "children" : [
                        {
                          "identifier" : "Package.text.self:@@@",
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
                        "get_for=text",
                        "implicit",
                        "interface"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "Package.text.self:@@@",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "children" : [
                            {
                              "identifier" : "Package.text.value",
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
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=internal",
                        "implicit",
                        "interface",
                        "set_for=text"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "Package.text.self:@@@",
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
                                        "direct_to_impl",
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
                              "scope" : "yield_stmt",
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
                        "_modify_for=text",
                        "access=internal",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "identifier" : "Package.text",
                  "isRoot" : false,
                  "scope" : "var_decl",
                  "tags" : [
                    "access=internal",
                    "interface",
                    "readImpl=stored",
                    "readWriteImpl=stored",
                    "writeImpl=stored"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "Package.init().self",
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
                  "identifier" : "Package.init()",
                  "isRoot" : false,
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=public",
                    "designated",
                    "interface"
                  ]
                }
              ],
              "identifier" : "Package",
              "isRoot" : false,
              "scope" : "struct_decl",
              "tags" : [
                "access=public",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "identifier" : "PackageSourceFile",
          "isRoot" : false,
          "scope" : "source_file"
        }
      ],
      "identifier" : "Package",
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
              "children" : [
                {
                  "children" : [
                    {
                      "children" : [
                        {
                          "isRoot" : false,
                          "scope" : "pattern_named",
                          "tags" : [
                            "window"
                          ]
                        },
                        {
                          "children" : [
                            {
                              "children" : [
                                {
                                  "isRoot" : false,
                                  "scope" : "component",
                                  "tags" : [
                                    "UIWindow",
                                    "bind=UIKit.(file).UIWindow",
                                    "id="
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "type_ident"
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "type_optional"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "pattern_typed"
                    },
                    {
                      "isRoot" : false,
                      "scope" : "nil_literal_expr",
                      "tags" : [
                        "implicit",
                        "initializer=**NULL**"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Processed",
                    "init:"
                  ]
                },
                {
                  "children" : [
                    {
                      "children" : [
                        {
                          "identifier" : "SceneDelegate.window.self:@@@",
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
                        "@objc",
                        "access=internal",
                        "get_for=window",
                        "implicit",
                        "interface"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "SceneDelegate.window.self:@@@",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "children" : [
                            {
                              "identifier" : "SceneDelegate.window.value",
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
                      "scope" : "accessor_decl",
                      "tags" : [
                        "@objc",
                        "access=internal",
                        "implicit",
                        "interface",
                        "set_for=window"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "SceneDelegate.window.self:@@@",
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
                                        "direct_to_impl",
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
                              "scope" : "yield_stmt",
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
                        "_modify_for=window",
                        "access=internal",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "identifier" : "SceneDelegate.window",
                  "isRoot" : false,
                  "scope" : "var_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface",
                    "readImpl=stored",
                    "readWriteImpl=stored",
                    "writeImpl=stored"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "SceneDelegate.scene(_:willConnectTo:options:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "SceneDelegate.scene(_:willConnectTo:options:).scene",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "identifier" : "SceneDelegate.scene(_:willConnectTo:options:).session",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=willConnectTo",
                            "interface"
                          ]
                        },
                        {
                          "identifier" : "SceneDelegate.scene(_:willConnectTo:options:).connectionOptions",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=options",
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
                                  "children" : [
                                    {
                                      "children" : [
                                        {
                                          "isRoot" : false,
                                          "scope" : "pattern_any"
                                        }
                                      ],
                                      "isRoot" : false,
                                      "scope" : "pattern_let",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "pattern_optional_some",
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
                                            "function_ref=unapplied"
                                          ]
                                        }
                                      ],
                                      "isRoot" : false,
                                      "scope" : "conditional_checked_cast_expr",
                                      "tags" : [
                                        "UIWindowScene",
                                        "value_cast",
                                        "writtenType="
                                      ]
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "paren_expr"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "pattern"
                            },
                            {
                              "children" : [
                                {
                                  "isRoot" : false,
                                  "scope" : "return_stmt"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "brace_stmt"
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "guard_stmt"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "brace_stmt"
                    }
                  ],
                  "identifier" : "SceneDelegate.scene(_:willConnectTo:options:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "SceneDelegate.sceneDidDisconnect(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "SceneDelegate.sceneDidDisconnect(_:).scene",
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
                      "isRoot" : false,
                      "scope" : "brace_stmt"
                    }
                  ],
                  "identifier" : "SceneDelegate.sceneDidDisconnect(_:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "SceneDelegate.sceneDidBecomeActive(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "SceneDelegate.sceneDidBecomeActive(_:).scene",
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
                      "isRoot" : false,
                      "scope" : "brace_stmt"
                    }
                  ],
                  "identifier" : "SceneDelegate.sceneDidBecomeActive(_:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "SceneDelegate.sceneWillResignActive(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "SceneDelegate.sceneWillResignActive(_:).scene",
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
                      "isRoot" : false,
                      "scope" : "brace_stmt"
                    }
                  ],
                  "identifier" : "SceneDelegate.sceneWillResignActive(_:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "SceneDelegate.sceneWillEnterForeground(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "SceneDelegate.sceneWillEnterForeground(_:).scene",
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
                      "isRoot" : false,
                      "scope" : "brace_stmt"
                    }
                  ],
                  "identifier" : "SceneDelegate.sceneWillEnterForeground(_:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "SceneDelegate.sceneDidEnterBackground(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "SceneDelegate.sceneDidEnterBackground(_:).scene",
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
                      "isRoot" : false,
                      "scope" : "brace_stmt"
                    }
                  ],
                  "identifier" : "SceneDelegate.sceneDidEnterBackground(_:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "SceneDelegate.deinit.self",
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
                  "identifier" : "SceneDelegate.deinit",
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
                      "identifier" : "SceneDelegate.init().self",
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
                  "identifier" : "SceneDelegate.init()",
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
              "identifier" : "SceneDelegate",
              "isRoot" : false,
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "identifier" : "SceneDelegateSourceFile",
          "isRoot" : false,
          "scope" : "source_file"
        },
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
                "Package"
              ]
            },
            {
              "children" : [
                {
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "Package",
                          "isRoot" : false,
                          "scope" : "struct_decl"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "pattern_named",
                      "tags" : [
                        "package"
                      ]
                    },
                    {
                      "arcs" : [
                        {
                          "identifier" : "Package",
                          "isRoot" : false,
                          "scope" : "struct_decl"
                        }
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "Package",
                              "isRoot" : false,
                              "scope" : "struct_decl"
                            }
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "Package",
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
                                "Package",
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
                          "identifier" : "Package",
                          "isRoot" : false,
                          "scope" : "struct_decl"
                        }
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "Package",
                              "isRoot" : false,
                              "scope" : "struct_decl"
                            }
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "Package",
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
                                "Package",
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
                      "identifier" : "Package",
                      "isRoot" : false,
                      "scope" : "struct_decl"
                    }
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "Package",
                          "isRoot" : false,
                          "scope" : "struct_decl"
                        }
                      ],
                      "children" : [
                        {
                          "identifier" : "ViewController.package.self",
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
                                      "identifier" : "Package",
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
                        "get_for=package",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "identifier" : "ViewController.package",
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
                      "identifier" : "ViewController.viewDidLoad().self",
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
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single"
                              ]
                            },
                            {
                              "isRoot" : false,
                              "scope" : "super_ref_expr"
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "dot_syntax_call_expr",
                          "tags" : [
                            "nothrow",
                            "super"
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
                  "identifier" : "ViewController.viewDidLoad()",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "dynamic",
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "ViewController.deinit.self",
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
                  "identifier" : "ViewController.deinit",
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
                      "identifier" : "ViewController.init(nibName:bundle:).self",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "ViewController.init(nibName:bundle:).nibNameOrNil",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=nibName",
                            "interface"
                          ]
                        },
                        {
                          "identifier" : "ViewController.init(nibName:bundle:).nibBundleOrNil",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=bundle",
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
                                    ",bundle",
                                    "implicit",
                                    "names=nibName"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=nibName:bundle:",
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
                  "identifier" : "ViewController.init(nibName:bundle:)",
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
                },
                {
                  "children" : [
                    {
                      "identifier" : "ViewController.init(coder:).self",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "ViewController.init(coder:).coder",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=coder",
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
                                    "names=coder"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=coder:",
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
                  "identifier" : "ViewController.init(coder:)",
                  "isRoot" : false,
                  "scope" : "constructor_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "designated",
                    "dynamic",
                    "failable=Optional",
                    "implicit",
                    "interface",
                    "required"
                  ]
                }
              ],
              "identifier" : "ViewController",
              "isRoot" : false,
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "identifier" : "ViewControllerSourceFile",
          "isRoot" : false,
          "scope" : "source_file"
        },
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
              "children" : [
                {
                  "children" : [
                    {
                      "identifier" : "AppDelegate.application(_:didFinishLaunchingWithOptions:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "AppDelegate.application(_:didFinishLaunchingWithOptions:).application",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "identifier" : "AppDelegate.application(_:didFinishLaunchingWithOptions:).launchOptions",
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
                              "isRoot" : false,
                              "scope" : "component",
                              "tags" : [
                                "Bool",
                                "bind=Swift.(file).Bool",
                                "id="
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "type_ident"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "result"
                    },
                    {
                      "children" : [
                        {
                          "children" : [
                            {
                              "isRoot" : false,
                              "scope" : "boolean_literal_expr",
                              "tags" : [
                                "initializer=**NULL**",
                                "value=true"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "return_stmt"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "brace_stmt"
                    }
                  ],
                  "identifier" : "AppDelegate.application(_:didFinishLaunchingWithOptions:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "AppDelegate.application(_:configurationForConnecting:options:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "AppDelegate.application(_:configurationForConnecting:options:).application",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "identifier" : "AppDelegate.application(_:configurationForConnecting:options:).connectingSceneSession",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "identifier" : "AppDelegate.application(_:configurationForConnecting:options:).options",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=options",
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
                              "isRoot" : false,
                              "scope" : "component",
                              "tags" : [
                                "UISceneConfiguration",
                                "id="
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "type_ident"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "result"
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
                                        "UISceneConfiguration",
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
                                  "children" : [
                                    {
                                      "children" : [
                                        {
                                          "isRoot" : false,
                                          "scope" : "string_literal_expr",
                                          "tags" : [
                                            "encoding=utf8",
                                            "initializer=**NULL**",
                                            "value=Default Configuration"
                                          ]
                                        }
                                      ],
                                      "isRoot" : false,
                                      "scope" : "inject_into_optional",
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
                                            "function_ref=unapplied"
                                          ]
                                        }
                                      ],
                                      "isRoot" : false,
                                      "scope" : "member_ref_expr"
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    ",sessionRole",
                                    "names=name"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=name:sessionRole:",
                                "nothrow"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "return_stmt"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "brace_stmt"
                    }
                  ],
                  "identifier" : "AppDelegate.application(_:configurationForConnecting:options:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "children" : [
                    {
                      "identifier" : "AppDelegate.application(_:didDiscardSceneSessions:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
                          "identifier" : "AppDelegate.application(_:didDiscardSceneSessions:).application",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "identifier" : "AppDelegate.application(_:didDiscardSceneSessions:).sceneSessions",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=didDiscardSceneSessions",
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
                  "identifier" : "AppDelegate.application(_:didDiscardSceneSessions:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
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
            }
          ],
          "identifier" : "AppDelegateSourceFile",
          "isRoot" : false,
          "scope" : "source_file"
        }
      ],
      "identifier" : "PackageManager",
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
