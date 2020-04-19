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
                "Cocoa"
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
                            "window"
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
                                  "scope" : "component",
                                  "tags" : [
                                    "NSWindow",
                                    "bind=AppKit.(file).NSWindow",
                                    "id="
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "type_ident",
                              "tags" : [

                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "type_implicitly_unwrapped_optional",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "pattern_typed",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "scope" : "nil_literal_expr",
                      "tags" : [
                        "implicit",
                        "initializer=**NULL**"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Processed",
                    "init:"
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
                          "name" : "AppDelegate.window.self:@@@",
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
                        "get_for=window",
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
                          "name" : "AppDelegate.window.self:@@@",
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
                              "name" : "AppDelegate.window.value",
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
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=internal",
                        "implicit",
                        "interface",
                        "set_for=window"
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
                          "name" : "AppDelegate.window.self:@@@",
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
                                        "direct_to_impl",
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
                              "scope" : "yield_stmt",
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
                        "_modify_for=window",
                        "access=internal",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "AppDelegate.window",
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
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "name" : "AppDelegate.applicationDidFinishLaunching(_:).self",
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
                          "name" : "AppDelegate.applicationDidFinishLaunching(_:).aNotification",
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

                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "AppDelegate.applicationDidFinishLaunching(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
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
                      "name" : "AppDelegate.applicationWillTerminate(_:).self",
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
                          "name" : "AppDelegate.applicationWillTerminate(_:).aNotification",
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

                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "AppDelegate.applicationWillTerminate(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
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
      "name" : "MacOSSDK",
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
                "UIKit"
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
                      "name" : "ViewController.viewDidLoad().self",
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

                              ],
                              "id" : "@@@",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single"
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

                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "dot_syntax_call_expr",
                          "tags" : [
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
                  "name" : "ViewController.viewDidLoad()",
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

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "name" : "ViewController.deinit.self",
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
                  "name" : "ViewController.deinit",
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
                      "name" : "ViewController.init(nibName:bundle:).self",
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
                          "name" : "ViewController.init(nibName:bundle:).nibNameOrNil",
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=nibName",
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
                          "name" : "ViewController.init(nibName:bundle:).nibBundleOrNil",
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=bundle",
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
                                    ",bundle",
                                    "implicit",
                                    "names=nibName"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=nibName:bundle:",
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
                  "name" : "ViewController.init(nibName:bundle:)",
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

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "name" : "ViewController.init(coder:).self",
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
                          "name" : "ViewController.init(coder:).coder",
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=coder",
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
                                    "names=coder"
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=coder:",
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
                  "name" : "ViewController.init(coder:)",
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
              "id" : "@@@",
              "name" : "ViewController",
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "id" : "@@@",
          "name" : "ViewControllerSourceFile",
          "scope" : "source_file",
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
              "scope" : "import_decl",
              "tags" : [
                "UIKit"
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
                            "window"
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
                                  "scope" : "component",
                                  "tags" : [
                                    "UIWindow",
                                    "bind=UIKit.(file).UIWindow",
                                    "id="
                                  ]
                                }
                              ],
                              "id" : "@@@",
                              "scope" : "type_ident",
                              "tags" : [

                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "type_optional",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "pattern_typed",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "scope" : "nil_literal_expr",
                      "tags" : [
                        "implicit",
                        "initializer=**NULL**"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Processed",
                    "init:"
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
                          "name" : "AppDelegate.window.self:@@@",
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
                        "@objc",
                        "access=internal",
                        "get_for=window",
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
                          "name" : "AppDelegate.window.self:@@@",
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
                              "name" : "AppDelegate.window.value",
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
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "@@@",
                          "name" : "AppDelegate.window.self:@@@",
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
                                        "direct_to_impl",
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
                              "scope" : "yield_stmt",
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
                        "_modify_for=window",
                        "access=internal",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "AppDelegate.window",
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

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "@@@",
                      "name" : "AppDelegate.application(_:didFinishLaunchingWithOptions:).self",
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
                          "name" : "AppDelegate.application(_:didFinishLaunchingWithOptions:).application",
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
                          "name" : "AppDelegate.application(_:didFinishLaunchingWithOptions:).launchOptions",
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

                              ],
                              "id" : "@@@",
                              "scope" : "component",
                              "tags" : [
                                "Bool",
                                "bind=Swift.(file).Bool",
                                "id="
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "type_ident",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "@@@",
                      "scope" : "result",
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
                              "scope" : "boolean_literal_expr",
                              "tags" : [
                                "initializer=**NULL**",
                                "value=true"
                              ]
                            }
                          ],
                          "id" : "@@@",
                          "scope" : "return_stmt",
                          "tags" : [

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
                  "name" : "AppDelegate.application(_:didFinishLaunchingWithOptions:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
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
                      "name" : "AppDelegate.applicationWillResignActive(_:).self",
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
                          "name" : "AppDelegate.applicationWillResignActive(_:).application",
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

                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "AppDelegate.applicationWillResignActive(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
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
                      "name" : "AppDelegate.applicationDidEnterBackground(_:).self",
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
                          "name" : "AppDelegate.applicationDidEnterBackground(_:).application",
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

                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "AppDelegate.applicationDidEnterBackground(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
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
                      "name" : "AppDelegate.applicationWillEnterForeground(_:).self",
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
                          "name" : "AppDelegate.applicationWillEnterForeground(_:).application",
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

                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "AppDelegate.applicationWillEnterForeground(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
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
                      "name" : "AppDelegate.applicationDidBecomeActive(_:).self",
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
                          "name" : "AppDelegate.applicationDidBecomeActive(_:).application",
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

                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "AppDelegate.applicationDidBecomeActive(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
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
                      "name" : "AppDelegate.applicationWillTerminate(_:).self",
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
                          "name" : "AppDelegate.applicationWillTerminate(_:).application",
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

                      ],
                      "id" : "@@@",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "@@@",
                  "name" : "AppDelegate.applicationWillTerminate(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
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
      "name" : "iOSSDK",
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
                                                    XCTStringMatchesPattern(string: additionalInformation, pattern: graphString)
                                                    expectation.fulfill()
        })
    }

}
