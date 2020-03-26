//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTest {

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
          "children" : [
            {
              "isRoot" : false,
              "scope" : "import_decl",
              "tags" : [
                "Cocoa"
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
                                    "NSWindow",
                                    "bind=AppKit.(file).NSWindow",
                                    "id="
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "type_ident"
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "type_implicitly_unwrapped_optional"
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
                        "get_for=window",
                        "implicit",
                        "interface"
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
                          "children" : [
                            {
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
                  "identifier" : "AppDelegate.window",
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
                      "identifier" : "AppDelegate.applicationDidFinishLaunching(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
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
                  "children" : [
                    {
                      "identifier" : "AppDelegate.applicationWillTerminate(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
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
                      "identifier" : "AppDelegate.applicationWillResignActive(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
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
                  "children" : [
                    {
                      "identifier" : "AppDelegate.applicationDidEnterBackground(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
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
                  "children" : [
                    {
                      "identifier" : "AppDelegate.applicationWillEnterForeground(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
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
                  "children" : [
                    {
                      "identifier" : "AppDelegate.applicationDidBecomeActive(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
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
                  "children" : [
                    {
                      "identifier" : "AppDelegate.applicationWillTerminate(_:).self",
                      "isRoot" : false,
                      "scope" : "parameter"
                    },
                    {
                      "children" : [
                        {
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
