//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTests {

    func testMacOSGraphForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "MacOSSDK",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme": "MacOSSDK"],
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
          "identifier" : "AppDelegate.Type",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "children" : [
            {
              "isRoot" : false,
              "scope" : "import_decl",
              "tags" : [
                "Cocoa"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "AppDelegate.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "NSObject",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "NSApplicationDelegate",
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
                          "identifier" : "NSWindow",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "NSWindow",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "pattern_named",
                          "tags" : [
                            "window"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "pattern_typed"
                    },
                    {
                      "arcs" : [
                        {
                          "identifier" : "NSWindow",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "NSWindow.Type",
                              "isRoot" : false,
                              "scope" : "unknown"
                            },
                            {
                              "identifier" : "NSWindow",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "declref_expr",
                          "tags" : [
                            "function_ref=unapplied",
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [
                            {
                              "identifier" : "NSWindow.Type",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
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
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "pattern_binding_decl"
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "NSWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "NSWindow",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "children" : [
                        {
                          "identifier" : "AppDelegate.window.self:@@@",
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
                                      "identifier" : "NSWindow",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        {
                                          "identifier" : "NSWindow",
                                          "isRoot" : false,
                                          "scope" : "unknown"
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
                                  "scope" : "load_expr",
                                  "tags" : [
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
                      "arcs" : [
                        {
                          "identifier" : "NSWindow",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "children" : [
                        {
                          "identifier" : "AppDelegate.window.self:@@@",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "NSWindow",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "identifier" : "AppDelegate.window.value",
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
                                  "arcs" : [
                                    {
                                      "identifier" : "NSWindow",
                                      "isRoot" : false,
                                      "scope" : "unknown"
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
                                },
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "NSWindow",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
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
                          "identifier" : "AppDelegate.window.self:@@@",
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
                                      "identifier" : "NSWindow",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        {
                                          "identifier" : "NSWindow",
                                          "isRoot" : false,
                                          "scope" : "unknown"
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
                  "identifier" : "AppDelegate.window",
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
                  "arcs" : [
                    {
                      "identifier" : "NSWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "identifier" : "AppDelegate.self:@@@",
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
                                  "identifier" : "NSWindow",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "NSWindow",
                                      "isRoot" : false,
                                      "scope" : "unknown"
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
                              "scope" : "load_expr",
                              "tags" : [
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
                  "arcs" : [
                    {
                      "identifier" : "NSWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "identifier" : "AppDelegate.self:@@@",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "NSWindow",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "identifier" : "AppDelegate.value",
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
                              "arcs" : [
                                {
                                  "identifier" : "NSWindow",
                                  "isRoot" : false,
                                  "scope" : "unknown"
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
                            },
                            {
                              "arcs" : [
                                {
                                  "identifier" : "NSWindow",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
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
                      "identifier" : "AppDelegate.self:@@@",
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
                                  "identifier" : "NSWindow",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "NSWindow",
                                      "isRoot" : false,
                                      "scope" : "unknown"
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
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "Notification",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "identifier" : "AppDelegate.applicationDidFinishLaunching(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "Notification",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "identifier" : "AppDelegate.applicationDidFinishLaunching(_:).aNotification",
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
                  "identifier" : "AppDelegate.applicationDidFinishLaunching(_:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "Notification",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "identifier" : "AppDelegate.applicationWillTerminate(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "Notification",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "identifier" : "AppDelegate.applicationWillTerminate(_:).aNotification",
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
                  "identifier" : "AppDelegate.applicationWillTerminate(_:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate.Type",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
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
                              "arcs" : [
                                {
                                  "identifier" : "NSObject",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "NSObject",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        {
                                          "identifier" : "NSObject",
                                          "isRoot" : false,
                                          "scope" : "unknown"
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
                                          "identifier" : "NSObject",
                                          "isRoot" : false,
                                          "scope" : "unknown"
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
                },
                {
                  "children" : [
                    {
                      "identifier" : "AppDelegate.deinit.self",
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
                  "identifier" : "AppDelegate.deinit",
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
              "identifier" : "AppDelegate",
              "isRoot" : false,
              "scope" : "class_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "identifier" : "AppDelegateSourceFile",
          "isRoot" : false,
          "scope" : "source_file"
        },
        {
          "identifier" : "NSApplicationDelegate",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "identifier" : "NSObject",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "identifier" : "NSWindow",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "identifier" : "NSWindow.Type",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "identifier" : "Notification",
          "isRoot" : false,
          "scope" : "unknown"
        }
      ],
      "identifier" : "MacOSSDK",
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

    func testIOSGraphForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "iOSSDK",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme": "iOSSDK"],
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
          "identifier" : "Any",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "identifier" : "AppDelegate.Type",
          "isRoot" : false,
          "scope" : "unknown"
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
              "arcs" : [
                {
                  "identifier" : "AppDelegate.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "UIResponder",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "UIApplicationDelegate",
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
                          "identifier" : "UIWindow",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "UIWindow",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "pattern_named",
                          "tags" : [
                            "window"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "pattern_typed"
                    },
                    {
                      "arcs" : [
                        {
                          "identifier" : "UIWindow",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "UIWindow.Type",
                              "isRoot" : false,
                              "scope" : "unknown"
                            },
                            {
                              "identifier" : "UIWindow",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "declref_expr",
                          "tags" : [
                            "function_ref=unapplied",
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [
                            {
                              "identifier" : "UIWindow.Type",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
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
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "pattern_binding_decl"
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "UIWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "UIWindow",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "children" : [
                        {
                          "identifier" : "AppDelegate.window.self:@@@",
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
                                      "identifier" : "UIWindow",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        {
                                          "identifier" : "UIWindow",
                                          "isRoot" : false,
                                          "scope" : "unknown"
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
                                  "scope" : "load_expr",
                                  "tags" : [
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
                      "arcs" : [
                        {
                          "identifier" : "UIWindow",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "children" : [
                        {
                          "identifier" : "AppDelegate.window.self:@@@",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "UIWindow",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "identifier" : "AppDelegate.window.value",
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
                                  "arcs" : [
                                    {
                                      "identifier" : "UIWindow",
                                      "isRoot" : false,
                                      "scope" : "unknown"
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
                                },
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "UIWindow",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
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
                          "identifier" : "AppDelegate.window.self:@@@",
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
                                      "identifier" : "UIWindow",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        {
                                          "identifier" : "UIWindow",
                                          "isRoot" : false,
                                          "scope" : "unknown"
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
                  "identifier" : "AppDelegate.window",
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
                  "arcs" : [
                    {
                      "identifier" : "UIWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "identifier" : "AppDelegate.self:@@@",
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
                                  "identifier" : "UIWindow",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "UIWindow",
                                      "isRoot" : false,
                                      "scope" : "unknown"
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
                              "scope" : "load_expr",
                              "tags" : [
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
                  "arcs" : [
                    {
                      "identifier" : "UIWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "identifier" : "AppDelegate.self:@@@",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "UIWindow",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "identifier" : "AppDelegate.value",
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
                              "arcs" : [
                                {
                                  "identifier" : "UIWindow",
                                  "isRoot" : false,
                                  "scope" : "unknown"
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
                            },
                            {
                              "arcs" : [
                                {
                                  "identifier" : "UIWindow",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
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
                      "identifier" : "AppDelegate.self:@@@",
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
                                  "identifier" : "UIWindow",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "UIWindow",
                                      "isRoot" : false,
                                      "scope" : "unknown"
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
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "UIApplication",
                      "isRoot" : false,
                      "scope" : "unknown"
                    },
                    {
                      "identifier" : "UIApplication.LaunchOptionsKey",
                      "isRoot" : false,
                      "scope" : "unknown"
                    },
                    {
                      "identifier" : "Any",
                      "isRoot" : false,
                      "scope" : "unknown"
                    },
                    {
                      "identifier" : "Bool",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "identifier" : "AppDelegate.application(_:didFinishLaunchingWithOptions:).self",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "UIApplication",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "identifier" : "AppDelegate.application(_:didFinishLaunchingWithOptions:).application",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [
                            {
                              "identifier" : "UIApplication.LaunchOptionsKey",
                              "isRoot" : false,
                              "scope" : "unknown"
                            },
                            {
                              "identifier" : "Any",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
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
                              "arcs" : [
                                {
                                  "identifier" : "Bool",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
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
                  "arcs" : [
                    {
                      "identifier" : "UIApplication",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "identifier" : "AppDelegate.applicationWillResignActive(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "UIApplication",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "identifier" : "AppDelegate.applicationWillResignActive(_:).application",
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
                  "identifier" : "AppDelegate.applicationWillResignActive(_:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "UIApplication",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "identifier" : "AppDelegate.applicationDidEnterBackground(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "UIApplication",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "identifier" : "AppDelegate.applicationDidEnterBackground(_:).application",
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
                  "identifier" : "AppDelegate.applicationDidEnterBackground(_:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "UIApplication",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "identifier" : "AppDelegate.applicationWillEnterForeground(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "UIApplication",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "identifier" : "AppDelegate.applicationWillEnterForeground(_:).application",
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
                  "identifier" : "AppDelegate.applicationWillEnterForeground(_:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "UIApplication",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "identifier" : "AppDelegate.applicationDidBecomeActive(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "UIApplication",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "identifier" : "AppDelegate.applicationDidBecomeActive(_:).application",
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
                  "identifier" : "AppDelegate.applicationDidBecomeActive(_:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "UIApplication",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "identifier" : "AppDelegate.applicationWillTerminate(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "UIApplication",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "identifier" : "AppDelegate.applicationWillTerminate(_:).application",
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
                  "identifier" : "AppDelegate.applicationWillTerminate(_:)",
                  "isRoot" : false,
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate.Type",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
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
                              "arcs" : [
                                {
                                  "identifier" : "UIResponder",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "UIResponder",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        {
                                          "identifier" : "UIResponder",
                                          "isRoot" : false,
                                          "scope" : "unknown"
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
                                          "identifier" : "UIResponder",
                                          "isRoot" : false,
                                          "scope" : "unknown"
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
                },
                {
                  "children" : [
                    {
                      "identifier" : "AppDelegate.deinit.self",
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
                  "identifier" : "AppDelegate.deinit",
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
              "identifier" : "AppDelegate",
              "isRoot" : false,
              "scope" : "class_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "identifier" : "AppDelegateSourceFile",
          "isRoot" : false,
          "scope" : "source_file"
        },
        {
          "identifier" : "Bool",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "identifier" : "Bundle",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "identifier" : "NSCoder",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "identifier" : "String",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "identifier" : "UIApplication",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "identifier" : "UIApplication.LaunchOptionsKey",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "identifier" : "UIApplicationDelegate",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "identifier" : "UIResponder",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "identifier" : "UIViewController",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "identifier" : "UIWindow",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "identifier" : "UIWindow.Type",
          "isRoot" : false,
          "scope" : "unknown"
        },
        {
          "identifier" : "ViewController.Type",
          "isRoot" : false,
          "scope" : "unknown"
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
              "arcs" : [
                {
                  "identifier" : "ViewController.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "UIViewController",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
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
                      "arcs" : [
                        {
                          "identifier" : "Void",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "Void",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                {
                                  "identifier" : "UIViewController",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                },
                                {
                                  "identifier" : "Void",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single"
                              ]
                            },
                            {
                              "arcs" : [
                                {
                                  "identifier" : "UIViewController",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
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
                  "arcs" : [
                    {
                      "identifier" : "ViewController.Type",
                      "isRoot" : false,
                      "scope" : "unknown"
                    },
                    {
                      "identifier" : "String",
                      "isRoot" : false,
                      "scope" : "unknown"
                    },
                    {
                      "identifier" : "Bundle",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
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
                          "arcs" : [
                            {
                              "identifier" : "String",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
                          "identifier" : "ViewController.init(nibName:bundle:).nibNameOrNil",
                          "isRoot" : false,
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=nibName",
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [
                            {
                              "identifier" : "Bundle",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
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
                              "arcs" : [
                                {
                                  "identifier" : "UIViewController",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "String",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    },
                                    {
                                      "identifier" : "Bundle",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    },
                                    {
                                      "identifier" : "UIViewController",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        {
                                          "identifier" : "UIViewController",
                                          "isRoot" : false,
                                          "scope" : "unknown"
                                        },
                                        {
                                          "identifier" : "String",
                                          "isRoot" : false,
                                          "scope" : "unknown"
                                        },
                                        {
                                          "identifier" : "Bundle",
                                          "isRoot" : false,
                                          "scope" : "unknown"
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
                                          "identifier" : "UIViewController",
                                          "isRoot" : false,
                                          "scope" : "unknown"
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
                                  "arcs" : [
                                    {
                                      "identifier" : "String",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    },
                                    {
                                      "identifier" : "Bundle",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        {
                                          "identifier" : "String",
                                          "isRoot" : false,
                                          "scope" : "unknown"
                                        }
                                      ],
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [
                                        {
                                          "identifier" : "Bundle",
                                          "isRoot" : false,
                                          "scope" : "unknown"
                                        }
                                      ],
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
                  "arcs" : [
                    {
                      "identifier" : "ViewController.Type",
                      "isRoot" : false,
                      "scope" : "unknown"
                    },
                    {
                      "identifier" : "NSCoder",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
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
                          "arcs" : [
                            {
                              "identifier" : "NSCoder",
                              "isRoot" : false,
                              "scope" : "unknown"
                            }
                          ],
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
                              "arcs" : [
                                {
                                  "identifier" : "UIViewController",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "NSCoder",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    },
                                    {
                                      "identifier" : "UIViewController",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        {
                                          "identifier" : "UIViewController",
                                          "isRoot" : false,
                                          "scope" : "unknown"
                                        },
                                        {
                                          "identifier" : "NSCoder",
                                          "isRoot" : false,
                                          "scope" : "unknown"
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
                                          "identifier" : "UIViewController",
                                          "isRoot" : false,
                                          "scope" : "unknown"
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
                                  "arcs" : [
                                    {
                                      "identifier" : "NSCoder",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        {
                                          "identifier" : "NSCoder",
                                          "isRoot" : false,
                                          "scope" : "unknown"
                                        }
                                      ],
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
                },
                {
                  "children" : [
                    {
                      "identifier" : "ViewController.deinit.self",
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
                  "identifier" : "ViewController.deinit",
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
              "identifier" : "ViewController",
              "isRoot" : false,
              "scope" : "class_decl",
              "tags" : [
                "@objc",
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
          "identifier" : "Void",
          "isRoot" : false,
          "scope" : "unknown"
        }
      ],
      "identifier" : "iOSSDK",
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
