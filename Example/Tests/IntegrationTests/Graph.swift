//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTests {

    func testMacOSGraphForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "MacOSSDK",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme": "MacOSSDK",
                                                           "target": "MacOSSDK"],
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
      "identifier" : "@lvalueNSWindow",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "AppDelegate.Type",
      "isRoot" : false,
      "scope" : "unknown"
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
          "isRoot" : false,
          "scope" : "import_decl"
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
            },
            {
              "identifier" : "NSWindow",
              "isRoot" : false,
              "scope" : "unknown"
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
              "children" : [
                {
                  "isRoot" : false,
                  "scope" : "pattern_binding_decl"
                },
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
                  "scope" : "dot_syntax_call_expr",
                  "tags" : [
                    "decl=Swift.(file).Optional.none",
                    "function_ref=unapplied",
                    "implicit"
                  ]
                },
                {
                  "children" : [
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
                        "implicit",
                        "typerepr="
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "declref_expr"
                }
              ],
              "isRoot" : false,
              "scope" : "pattern_typed",
              "tags" : [
                "implicit",
                "nothrow"
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
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    },
                    {
                      "identifier" : "NSWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    },
                    {
                      "identifier" : "@lvalueNSWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "AppDelegate",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "identifier" : "window.self",
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
                          "identifier" : "AppDelegate",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [
                        "function_ref=unapplied",
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
                      "children" : [
                        {
                          "children" : [
                            {
                              "children" : [
                                {
                                  "isRoot" : false,
                                  "scope" : "return_stmt"
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
                          "scope" : "member_ref_expr",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "declref_expr",
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
                    "direct_to_storage",
                    "get_for=window",
                    "implicit",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    },
                    {
                      "identifier" : "NSWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    },
                    {
                      "identifier" : "@lvalueNSWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "AppDelegate",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "identifier" : "window.self",
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
                          "identifier" : "window.self.value",
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
                      "arcs" : [
                        {
                          "identifier" : "AppDelegate",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "brace_stmt",
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
                              "scope" : "assign_expr"
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
                          "scope" : "member_ref_expr",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "declref_expr",
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
                    "direct_to_storage",
                    "implicit",
                    "interface",
                    "set_for=window"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    },
                    {
                      "identifier" : "@lvalueNSWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "AppDelegate",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "identifier" : "window.self",
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
                          "identifier" : "AppDelegate",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [
                        "function_ref=unapplied",
                        "implicit"
                      ]
                    },
                    {
                      "arcs" : [
                        {
                          "identifier" : "inoutNSWindow",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "children" : [
                        {
                          "children" : [
                            {
                              "children" : [
                                {
                                  "isRoot" : false,
                                  "scope" : "yield_stmt"
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
                          "scope" : "member_ref_expr",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "declref_expr",
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
                    "direct_to_impl",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "identifier" : "window",
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
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                },
                {
                  "identifier" : "NSWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "@lvalueNSWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "self",
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
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "function_ref=unapplied",
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
                  "children" : [
                    {
                      "children" : [
                        {
                          "children" : [
                            {
                              "isRoot" : false,
                              "scope" : "return_stmt"
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
                      "scope" : "member_ref_expr",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "declref_expr",
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
                "direct_to_storage",
                "get_for=window",
                "implicit",
                "interface"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                },
                {
                  "identifier" : "NSWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "@lvalueNSWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "self",
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
                      "identifier" : "self.value",
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
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
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
                          "scope" : "assign_expr"
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
                      "scope" : "member_ref_expr",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "declref_expr",
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
                "direct_to_storage",
                "implicit",
                "interface",
                "set_for=window"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                },
                {
                  "identifier" : "@lvalueNSWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "self",
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
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "function_ref=unapplied",
                    "implicit"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "inoutNSWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "children" : [
                        {
                          "children" : [
                            {
                              "isRoot" : false,
                              "scope" : "yield_stmt"
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
                      "scope" : "member_ref_expr",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "declref_expr",
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
                "direct_to_impl",
                "implicit",
                "interface"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                },
                {
                  "identifier" : "Notification",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "applicationDidFinishLaunching(_:).self",
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
                      "identifier" : "applicationDidFinishLaunching(_:).aNotification",
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
              "identifier" : "applicationDidFinishLaunching(_:)",
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
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                },
                {
                  "identifier" : "Notification",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "applicationWillTerminate(_:).self",
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
                      "identifier" : "applicationWillTerminate(_:).aNotification",
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
              "identifier" : "applicationWillTerminate(_:)",
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
                },
                {
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                },
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
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "init().self",
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
                      "identifier" : "NSObject",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
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
                              "scope" : "rebind_self_in_constructor_expr"
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
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "dot_syntax_call_expr",
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
                  "scope" : "other_constructor_ref_expr",
                  "tags" : [
                    "arg_labels=",
                    "implicit",
                    "nothrow"
                  ]
                }
              ],
              "identifier" : "init()",
              "isRoot" : false,
              "scope" : "constructor_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "designated",
                "dynamic",
                "implicit",
                "interface",
                "nothrow",
                "super"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "deinit.self",
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
              "identifier" : "deinit",
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
          "isRoot" : false,
          "scope" : "pattern_named"
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
    },
    {
      "identifier" : "inoutNSWindow",
      "isRoot" : false,
      "scope" : "unknown"
    }
  ],
  "isRoot" : true,
  "scope" : "root"
}
"""
                                                    XCTStringsContainedInString(strings: graphString.components(separatedBy: "\n"), string: additionalInformation)
                                                    XCTAssertEqual(graphString, additionalInformation)
                                                    expectation.fulfill()
        })
    }

    func testIOSGraphForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "iOSSDK",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme": "iOSSDK",
                                                           "target": "iOSSDK"],
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
      "identifier" : "@lvalueUIWindow",
      "isRoot" : false,
      "scope" : "unknown"
    },
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
          "scope" : "import_decl"
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
            },
            {
              "identifier" : "UIWindow",
              "isRoot" : false,
              "scope" : "unknown"
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
              "children" : [
                {
                  "isRoot" : false,
                  "scope" : "pattern_binding_decl"
                },
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
                  "scope" : "dot_syntax_call_expr",
                  "tags" : [
                    "decl=Swift.(file).Optional.none",
                    "function_ref=unapplied",
                    "implicit"
                  ]
                },
                {
                  "children" : [
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
                        "implicit",
                        "typerepr="
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "declref_expr"
                }
              ],
              "isRoot" : false,
              "scope" : "pattern_typed",
              "tags" : [
                "implicit",
                "nothrow"
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
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    },
                    {
                      "identifier" : "UIWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    },
                    {
                      "identifier" : "@lvalueUIWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "AppDelegate",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "identifier" : "window.self",
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
                          "identifier" : "AppDelegate",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [
                        "function_ref=unapplied",
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
                      "children" : [
                        {
                          "children" : [
                            {
                              "children" : [
                                {
                                  "isRoot" : false,
                                  "scope" : "return_stmt"
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
                          "scope" : "member_ref_expr",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "declref_expr",
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
                    "direct_to_storage",
                    "get_for=window",
                    "implicit",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    },
                    {
                      "identifier" : "UIWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    },
                    {
                      "identifier" : "@lvalueUIWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "AppDelegate",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "identifier" : "window.self",
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
                          "identifier" : "window.self.value",
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
                      "arcs" : [
                        {
                          "identifier" : "AppDelegate",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "brace_stmt",
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
                              "scope" : "assign_expr"
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
                          "scope" : "member_ref_expr",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "declref_expr",
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
                    "direct_to_storage",
                    "implicit",
                    "interface",
                    "set_for=window"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    },
                    {
                      "identifier" : "@lvalueUIWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        {
                          "identifier" : "AppDelegate",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "identifier" : "window.self",
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
                          "identifier" : "AppDelegate",
                          "isRoot" : false,
                          "scope" : "class_decl"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [
                        "function_ref=unapplied",
                        "implicit"
                      ]
                    },
                    {
                      "arcs" : [
                        {
                          "identifier" : "inoutUIWindow",
                          "isRoot" : false,
                          "scope" : "unknown"
                        }
                      ],
                      "children" : [
                        {
                          "children" : [
                            {
                              "children" : [
                                {
                                  "isRoot" : false,
                                  "scope" : "yield_stmt"
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
                          "scope" : "member_ref_expr",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "declref_expr",
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
                    "direct_to_impl",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "identifier" : "window",
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
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                },
                {
                  "identifier" : "UIWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "@lvalueUIWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "self",
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
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "function_ref=unapplied",
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
                  "children" : [
                    {
                      "children" : [
                        {
                          "children" : [
                            {
                              "isRoot" : false,
                              "scope" : "return_stmt"
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
                      "scope" : "member_ref_expr",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "declref_expr",
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
                "direct_to_storage",
                "get_for=window",
                "implicit",
                "interface"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                },
                {
                  "identifier" : "UIWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "@lvalueUIWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "self",
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
                      "identifier" : "self.value",
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
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
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
                          "scope" : "assign_expr"
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
                      "scope" : "member_ref_expr",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "declref_expr",
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
                "direct_to_storage",
                "implicit",
                "interface",
                "set_for=window"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                },
                {
                  "identifier" : "@lvalueUIWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "self",
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
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "function_ref=unapplied",
                    "implicit"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "inoutUIWindow",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "children" : [
                    {
                      "children" : [
                        {
                          "children" : [
                            {
                              "isRoot" : false,
                              "scope" : "yield_stmt"
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
                      "scope" : "member_ref_expr",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "declref_expr",
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
                "direct_to_impl",
                "implicit",
                "interface"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
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
                  "identifier" : "Any",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "Bool",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "Int1",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "application(_:didFinishLaunchingWithOptions:).self",
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
                      "identifier" : "application(_:didFinishLaunchingWithOptions:).application",
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
                      "identifier" : "application(_:didFinishLaunchingWithOptions:).application.launchOptions",
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
                  "scope" : "result",
                  "tags" : [
                    "bind=Swift.(file).Bool",
                    "id="
                  ]
                },
                {
                  "children" : [
                    {
                      "isRoot" : false,
                      "scope" : "type_ident"
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "component"
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "Bool.Type",
                      "isRoot" : false,
                      "scope" : "unknown"
                    },
                    {
                      "identifier" : "Int1",
                      "isRoot" : false,
                      "scope" : "unknown"
                    },
                    {
                      "identifier" : "Bool",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "decl=Swift.(file).Bool",
                    "function_ref=single",
                    "implicit"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "Bool",
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
                              "identifier" : "_builtinBooleanLiteral",
                              "isRoot" : false,
                              "scope" : "unknown"
                            },
                            {
                              "identifier" : "Builtin.Int1",
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
                                      "identifier" : "Bool.Type",
                                      "isRoot" : false,
                                      "scope" : "unknown"
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "type_expr",
                                  "tags" : [
                                    "implicit",
                                    "typerepr="
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "return_stmt"
                            },
                            {
                              "arcs" : [
                                {
                                  "identifier" : "Builtin.Int1",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "tuple_expr",
                              "tags" : [
                                "value=true"
                              ]
                            },
                            {
                              "isRoot" : false,
                              "scope" : "boolean_literal_expr"
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "call_expr",
                          "tags" : [
                            "implicit",
                            "names=_builtinBooleanLiteral"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "constructor_ref_call_expr"
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "declref_expr",
                  "tags" : [
                    "implicit",
                    "nothrow"
                  ]
                }
              ],
              "identifier" : "application(_:didFinishLaunchingWithOptions:)",
              "isRoot" : false,
              "scope" : "func_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "implicit",
                "interface",
                "nothrow"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                },
                {
                  "identifier" : "UIApplication",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "applicationWillResignActive(_:).self",
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
                      "identifier" : "applicationWillResignActive(_:).application",
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
              "identifier" : "applicationWillResignActive(_:)",
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
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                },
                {
                  "identifier" : "UIApplication",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "applicationDidEnterBackground(_:).self",
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
                      "identifier" : "applicationDidEnterBackground(_:).application",
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
              "identifier" : "applicationDidEnterBackground(_:)",
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
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                },
                {
                  "identifier" : "UIApplication",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "applicationWillEnterForeground(_:).self",
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
                      "identifier" : "applicationWillEnterForeground(_:).application",
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
              "identifier" : "applicationWillEnterForeground(_:)",
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
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                },
                {
                  "identifier" : "UIApplication",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "applicationDidBecomeActive(_:).self",
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
                      "identifier" : "applicationDidBecomeActive(_:).application",
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
              "identifier" : "applicationDidBecomeActive(_:)",
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
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                },
                {
                  "identifier" : "UIApplication",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "applicationWillTerminate(_:).self",
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
                      "identifier" : "applicationWillTerminate(_:).application",
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
              "identifier" : "applicationWillTerminate(_:)",
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
                },
                {
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                },
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
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "init().self",
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
                      "identifier" : "UIResponder",
                      "isRoot" : false,
                      "scope" : "unknown"
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
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
                              "scope" : "rebind_self_in_constructor_expr"
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
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "dot_syntax_call_expr",
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
                  "scope" : "other_constructor_ref_expr",
                  "tags" : [
                    "arg_labels=",
                    "implicit",
                    "nothrow"
                  ]
                }
              ],
              "identifier" : "init()",
              "isRoot" : false,
              "scope" : "constructor_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "designated",
                "dynamic",
                "implicit",
                "interface",
                "nothrow",
                "super"
              ]
            },
            {
              "arcs" : [
                {
                  "identifier" : "AppDelegate",
                  "isRoot" : false,
                  "scope" : "class_decl"
                }
              ],
              "children" : [
                {
                  "arcs" : [
                    {
                      "identifier" : "AppDelegate",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "identifier" : "deinit.self",
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
                    "implicit",
                    "rang"
                  ]
                }
              ],
              "identifier" : "deinit",
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
          "isRoot" : false,
          "scope" : "pattern_named"
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
      "identifier" : "Bool.Type",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "Builtin.Int1",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "Bundle",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "Int1",
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
          "scope" : "import_decl"
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
              "arcs" : [
                {
                  "identifier" : "Void",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
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
                  "scope" : "brace_stmt",
                  "tags" : [
                    "function_ref=single"
                  ]
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
                              "isRoot" : false,
                              "scope" : "super_ref_expr"
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "call_expr"
                        },
                        {
                          "isRoot" : false,
                          "scope" : "tuple_expr"
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "dot_syntax_call_expr"
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "declref_expr",
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
                "interface",
                "nothrow",
                "super"
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
                },
                {
                  "identifier" : "UIViewController",
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
                      "identifier" : "ViewController.init(nibName:bundle:).nibNameOrNil.nibBundleOrNil",
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
                  "scope" : "brace_stmt",
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
                  "children" : [
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "nibName",
                              "isRoot" : false,
                              "scope" : "unknown"
                            },
                            {
                              "identifier" : "String",
                              "isRoot" : false,
                              "scope" : "unknown"
                            },
                            {
                              "identifier" : "bundle",
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
                              "children" : [
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
                              "scope" : "rebind_self_in_constructor_expr"
                            },
                            {
                              "arcs" : [
                                {
                                  "identifier" : "String",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "tuple_expr",
                              "tags" : [
                                "function_ref=unapplied",
                                "implicit"
                              ]
                            },
                            {
                              "children" : [
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
                              "scope" : "declref_expr"
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "call_expr",
                          "tags" : [
                            "bundle",
                            "implicit",
                            "names=nibName"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "dot_syntax_call_expr",
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
                  "scope" : "other_constructor_ref_expr",
                  "tags" : [
                    "arg_labels=nibName:bundle:",
                    "implicit",
                    "nothrow"
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
                "interface",
                "nothrow",
                "super"
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
                },
                {
                  "identifier" : "UIViewController",
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
                      "identifier" : "ViewController.init(coder:).aDecoder",
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
                  "scope" : "brace_stmt",
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
                  "children" : [
                    {
                      "children" : [
                        {
                          "arcs" : [
                            {
                              "identifier" : "coder",
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
                              "children" : [
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
                              "scope" : "rebind_self_in_constructor_expr"
                            },
                            {
                              "arcs" : [
                                {
                                  "identifier" : "NSCoder",
                                  "isRoot" : false,
                                  "scope" : "unknown"
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "tuple_expr",
                              "tags" : [
                                "function_ref=unapplied",
                                "implicit"
                              ]
                            },
                            {
                              "isRoot" : false,
                              "scope" : "declref_expr"
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "call_expr",
                          "tags" : [
                            "implicit",
                            "names=coder"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "dot_syntax_call_expr",
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
                  "scope" : "other_constructor_ref_expr",
                  "tags" : [
                    "arg_labels=coder:",
                    "implicit",
                    "nothrow"
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
                "nothrow",
                "required",
                "super"
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
    },
    {
      "identifier" : "_builtinBooleanLiteral",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "bundle",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "coder",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "inoutUIWindow",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "nibName",
      "isRoot" : false,
      "scope" : "unknown"
    }
  ],
  "isRoot" : true,
  "scope" : "root"
}
"""
                                                    XCTStringsContainedInString(strings: graphString.components(separatedBy: "\n"), string: additionalInformation)
                                                    XCTAssertEqual(graphString, additionalInformation)
                                                    expectation.fulfill()
        })
    }

}
