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
              "identifier" : "@@@",
              "isRoot" : false,
              "scope" : "import_decl",
              "tags" : [
                "Cocoa"
              ]
            },
            {
              "arcs" : [
                "@@@",
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
                        "@@@"
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
                                  "identifier" : "@@@",
                                  "isRoot" : false,
                                  "scope" : "component",
                                  "tags" : [
                                    "NSWindow",
                                    "bind=AppKit.(file).NSWindow",
                                    "id="
                                  ]
                                }
                              ],
                              "identifier" : "@@@",
                              "isRoot" : false,
                              "scope" : "type_ident",
                              "tags" : [

                              ]
                            }
                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "scope" : "type_implicitly_unwrapped_optional",
                          "tags" : [

                          ]
                        }
                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "scope" : "pattern_typed",
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
                      "scope" : "nil_literal_expr",
                      "tags" : [
                        "implicit",
                        "initializer=**NULL**"
                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
                  "scope" : "pattern_binding_decl",
                  "tags" : [
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
                          "identifier" : "@@@",
                          "isRoot" : false,
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
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "@@@",
                                  "isRoot" : false,
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
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
                            "implicit"
                          ]
                        }
                      ],
                      "identifier" : "@@@",
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
                                "@@@"
                              ],
                              "children" : [

                              ],
                              "identifier" : "@@@",
                              "isRoot" : false,
                              "name" : "AppDelegate.window.value",
                              "scope" : "parameter",
                              "tags" : [
                                "interface"
                              ]
                            }
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
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "@@@",
                                  "isRoot" : false,
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
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
                                  "scope" : "declref_expr",
                                  "tags" : [
                                    "function_ref=unapplied",
                                    "implicit"
                                  ]
                                }
                              ],
                              "identifier" : "@@@",
                              "isRoot" : false,
                              "scope" : "assign_expr",
                              "tags" : [
                                "implicit"
                              ]
                            }
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
                          "identifier" : "@@@",
                          "isRoot" : false,
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
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        }
                                      ],
                                      "identifier" : "@@@",
                                      "isRoot" : false,
                                      "scope" : "member_ref_expr",
                                      "tags" : [
                                        "direct_to_impl",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "@@@",
                                  "isRoot" : false,
                                  "scope" : "inout_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "identifier" : "@@@",
                              "isRoot" : false,
                              "scope" : "yield_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
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
                      "scope" : "accessor_decl",
                      "tags" : [
                        "_modify_for=window",
                        "access=internal",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
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
                            "@@@"
                          ],
                          "children" : [

                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "name" : "AppDelegate.applicationDidFinishLaunching(_:).aNotification",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
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

                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
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
                            "@@@"
                          ],
                          "children" : [

                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "name" : "AppDelegate.applicationWillTerminate(_:).aNotification",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
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

                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
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
                      "identifier" : "@@@",
                      "isRoot" : false,
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
                                      "identifier" : "@@@",
                                      "isRoot" : false,
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
                                      "identifier" : "@@@",
                                      "isRoot" : false,
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "@@@",
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

                                  ],
                                  "children" : [

                                  ],
                                  "identifier" : "@@@",
                                  "isRoot" : false,
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "identifier" : "@@@",
                              "isRoot" : false,
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
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
                        "implicit"
                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
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
              "identifier" : "@@@",
              "isRoot" : false,
              "name" : "AppDelegate",
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "identifier" : "@@@",
          "isRoot" : false,
          "name" : "AppDelegateSourceFile",
          "scope" : "source_file",
          "tags" : [

          ]
        }
      ],
      "identifier" : "@@@",
      "isRoot" : false,
      "name" : "MacOSSDK",
      "scope" : "module",
      "tags" : [

      ]
    }
  ],
  "identifier" : "@@@",
  "isRoot" : true,
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
              "identifier" : "@@@",
              "isRoot" : false,
              "scope" : "import_decl",
              "tags" : [
                "UIKit"
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
                      "identifier" : "@@@",
                      "isRoot" : false,
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
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "scope" : "parameter_list",
                      "tags" : [

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
                                "@@@",
                                "@@@"
                              ],
                              "children" : [

                              ],
                              "identifier" : "@@@",
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single"
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
                              "scope" : "super_ref_expr",
                              "tags" : [

                              ]
                            }
                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
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
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
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
                      "identifier" : "@@@",
                      "isRoot" : false,
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
                    "@@@",
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
                            "@@@"
                          ],
                          "children" : [

                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "name" : "ViewController.init(nibName:bundle:).nibNameOrNil",
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=nibName",
                            "interface"
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
                          "name" : "ViewController.init(nibName:bundle:).nibBundleOrNil",
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=bundle",
                            "interface"
                          ]
                        }
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
                            {
                              "arcs" : [
                                "@@@"
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    "@@@",
                                    "@@@",
                                    "@@@"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        "@@@",
                                        "@@@",
                                        "@@@"
                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "@@@",
                                      "isRoot" : false,
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
                                      "identifier" : "@@@",
                                      "isRoot" : false,
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "@@@",
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
                                    "@@@",
                                    "@@@"
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
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
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
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "@@@",
                                  "isRoot" : false,
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    ",bundle",
                                    "implicit",
                                    "names=nibName"
                                  ]
                                }
                              ],
                              "identifier" : "@@@",
                              "isRoot" : false,
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=nibName:bundle:",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
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
                        "implicit"
                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
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
                            "@@@"
                          ],
                          "children" : [

                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "name" : "ViewController.init(coder:).coder",
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=coder",
                            "interface"
                          ]
                        }
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
                            {
                              "arcs" : [
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
                                        "@@@",
                                        "@@@"
                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "@@@",
                                      "isRoot" : false,
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
                                      "identifier" : "@@@",
                                      "isRoot" : false,
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "@@@",
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
                                    "@@@"
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
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "@@@",
                                  "isRoot" : false,
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit",
                                    "names=coder"
                                  ]
                                }
                              ],
                              "identifier" : "@@@",
                              "isRoot" : false,
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=coder:",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
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
                        "implicit"
                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
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
              "identifier" : "@@@",
              "isRoot" : false,
              "name" : "ViewController",
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "identifier" : "@@@",
          "isRoot" : false,
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
              "identifier" : "@@@",
              "isRoot" : false,
              "scope" : "import_decl",
              "tags" : [
                "UIKit"
              ]
            },
            {
              "arcs" : [
                "@@@",
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
                        "@@@"
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
                                  "identifier" : "@@@",
                                  "isRoot" : false,
                                  "scope" : "component",
                                  "tags" : [
                                    "UIWindow",
                                    "bind=UIKit.(file).UIWindow",
                                    "id="
                                  ]
                                }
                              ],
                              "identifier" : "@@@",
                              "isRoot" : false,
                              "scope" : "type_ident",
                              "tags" : [

                              ]
                            }
                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "scope" : "type_optional",
                          "tags" : [

                          ]
                        }
                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
                      "scope" : "pattern_typed",
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
                      "scope" : "nil_literal_expr",
                      "tags" : [
                        "implicit",
                        "initializer=**NULL**"
                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
                  "scope" : "pattern_binding_decl",
                  "tags" : [
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
                          "identifier" : "@@@",
                          "isRoot" : false,
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
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "@@@",
                                  "isRoot" : false,
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
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
                            "implicit"
                          ]
                        }
                      ],
                      "identifier" : "@@@",
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
                                "@@@"
                              ],
                              "children" : [

                              ],
                              "identifier" : "@@@",
                              "isRoot" : false,
                              "name" : "AppDelegate.window.value",
                              "scope" : "parameter",
                              "tags" : [
                                "interface"
                              ]
                            }
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
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "@@@",
                                  "isRoot" : false,
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
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
                                  "scope" : "declref_expr",
                                  "tags" : [
                                    "function_ref=unapplied",
                                    "implicit"
                                  ]
                                }
                              ],
                              "identifier" : "@@@",
                              "isRoot" : false,
                              "scope" : "assign_expr",
                              "tags" : [
                                "implicit"
                              ]
                            }
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
                          "identifier" : "@@@",
                          "isRoot" : false,
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
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        }
                                      ],
                                      "identifier" : "@@@",
                                      "isRoot" : false,
                                      "scope" : "member_ref_expr",
                                      "tags" : [
                                        "direct_to_impl",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "@@@",
                                  "isRoot" : false,
                                  "scope" : "inout_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "identifier" : "@@@",
                              "isRoot" : false,
                              "scope" : "yield_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
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
                      "scope" : "accessor_decl",
                      "tags" : [
                        "_modify_for=window",
                        "access=internal",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
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
                    "@@@",
                    "@@@",
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
                            "@@@"
                          ],
                          "children" : [

                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "name" : "AppDelegate.application(_:didFinishLaunchingWithOptions:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [
                            "@@@",
                            "@@@"
                          ],
                          "children" : [

                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "name" : "AppDelegate.application(_:didFinishLaunchingWithOptions:).launchOptions",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
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
                            {
                              "arcs" : [

                              ],
                              "children" : [

                              ],
                              "identifier" : "@@@",
                              "isRoot" : false,
                              "scope" : "component",
                              "tags" : [
                                "Bool",
                                "bind=Swift.(file).Bool",
                                "id="
                              ]
                            }
                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "scope" : "type_ident",
                          "tags" : [

                          ]
                        }
                      ],
                      "identifier" : "@@@",
                      "isRoot" : false,
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
                                "@@@"
                              ],
                              "children" : [

                              ],
                              "identifier" : "@@@",
                              "isRoot" : false,
                              "scope" : "boolean_literal_expr",
                              "tags" : [
                                "initializer=**NULL**",
                                "value=true"
                              ]
                            }
                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "scope" : "return_stmt",
                          "tags" : [

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
                            "@@@"
                          ],
                          "children" : [

                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "name" : "AppDelegate.applicationWillResignActive(_:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
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

                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
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
                            "@@@"
                          ],
                          "children" : [

                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "name" : "AppDelegate.applicationDidEnterBackground(_:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
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

                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
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
                            "@@@"
                          ],
                          "children" : [

                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "name" : "AppDelegate.applicationWillEnterForeground(_:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
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

                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
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
                            "@@@"
                          ],
                          "children" : [

                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "name" : "AppDelegate.applicationDidBecomeActive(_:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
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

                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
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
                            "@@@"
                          ],
                          "children" : [

                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
                          "name" : "AppDelegate.applicationWillTerminate(_:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
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

                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
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
                      "identifier" : "@@@",
                      "isRoot" : false,
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
                                      "identifier" : "@@@",
                                      "isRoot" : false,
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
                                      "identifier" : "@@@",
                                      "isRoot" : false,
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "@@@",
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

                                  ],
                                  "children" : [

                                  ],
                                  "identifier" : "@@@",
                                  "isRoot" : false,
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "identifier" : "@@@",
                              "isRoot" : false,
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "identifier" : "@@@",
                          "isRoot" : false,
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
                        "implicit"
                      ]
                    }
                  ],
                  "identifier" : "@@@",
                  "isRoot" : false,
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
              "identifier" : "@@@",
              "isRoot" : false,
              "name" : "AppDelegate",
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "identifier" : "@@@",
          "isRoot" : false,
          "name" : "AppDelegateSourceFile",
          "scope" : "source_file",
          "tags" : [

          ]
        }
      ],
      "identifier" : "@@@",
      "isRoot" : false,
      "name" : "iOSSDK",
      "scope" : "module",
      "tags" : [

      ]
    }
  ],
  "identifier" : "@@@",
  "isRoot" : true,
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
