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
      "children" : [
        {
          "arcs" : [
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
              "arcs" : [
                {
                  "identifier" : "NSWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.window",
              "isRoot" : false,
              "scope" : "variable"
            },
            {
              "arcs" : [
                {
                  "identifier" : "Notification",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.applicationDidFinishLaunching(_:)",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "arcs" : [
                {
                  "identifier" : "Notification",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.applicationWillTerminate(_:)",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "identifier" : "AppDelegate.Type",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "AppDelegate",
          "isRoot" : false,
          "scope" : "class"
        }
      ],
      "identifier" : "AppDelegateSourceFile",
      "isRoot" : false,
      "scope" : "sourceFile"
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
      "identifier" : "Notification",
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
      "identifier" : "Any",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "arcs" : [
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
              "arcs" : [
                {
                  "identifier" : "UIWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.window",
              "isRoot" : false,
              "scope" : "variable"
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
              "identifier" : "AppDelegate.application(_:didFinishLaunchingWithOptions:)",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "arcs" : [
                {
                  "identifier" : "UIApplication",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.applicationWillResignActive(_:)",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "arcs" : [
                {
                  "identifier" : "UIApplication",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.applicationDidEnterBackground(_:)",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "arcs" : [
                {
                  "identifier" : "UIApplication",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.applicationWillEnterForeground(_:)",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "arcs" : [
                {
                  "identifier" : "UIApplication",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.applicationDidBecomeActive(_:)",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "arcs" : [
                {
                  "identifier" : "UIApplication",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.applicationWillTerminate(_:)",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "identifier" : "AppDelegate.Type",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "AppDelegate",
          "isRoot" : false,
          "scope" : "class"
        }
      ],
      "identifier" : "AppDelegateSourceFile",
      "isRoot" : false,
      "scope" : "sourceFile"
    },
    {
      "identifier" : "Bool",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "identifier" : "UIApplication.LaunchOptionsKey",
          "isRoot" : false,
          "scope" : "unknown"
        }
      ],
      "identifier" : "UIApplication",
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
              "identifier" : "ViewController.viewDidLoad()",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "identifier" : "ViewController.Type",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "ViewController",
          "isRoot" : false,
          "scope" : "class"
        }
      ],
      "identifier" : "ViewControllerSourceFile",
      "isRoot" : false,
      "scope" : "sourceFile"
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
