//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTests {

    func testMacOSASTForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "MacOSSDK",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme": "MacOSSDK",
                                                           "target": "MacOSSDK"],
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.generatingAST,
                                                 statusUpdateValidationHandler: { (_, additionalInformation, expectation) in
                                                    guard let additionalInformation = additionalInformation else {
                                                        XCTFail()
                                                        return
                                                    }
                                                    XCTStringMatchesPattern(string: additionalInformation, pattern: "(source_file \"/@@@/AppDelegate.swift\"\n  (import_decl range=[/@@@/AppDelegate.swift:9:1 - line:9:8] \'Cocoa\')\n  (class_decl range=[/@@@/AppDelegate.swift:12:1 - line:24:1] \"AppDelegate\" interface type=\'AppDelegate.Type\' access=internal @objc non-resilient inherits: NSObject, NSApplicationDelegate\n    (pattern_binding_decl range=[/@@@/AppDelegate.swift:14:20 - line:14:40]\n      (pattern_typed type=\'NSWindow?\'\n        (pattern_named type=\'NSWindow?\' \'window\')\n)\n      (dot_syntax_call_expr implicit type=\'NSWindow?\' nothrow\n        (declref_expr implicit type=\'(NSWindow?.Type) -> NSWindow?\' decl=Swift.(file).Optional.none [with (substitution_map generic_signature=<Wrapped> (substitution Wrapped -> NSWindow))] function_ref=unapplied)\n        (type_expr implicit type=\'NSWindow?.Type\' typerepr=\'<<NULL>>\')))\n    (var_decl range=[/@@@/AppDelegate.swift:14:24 - line:14:24] \"window\" type=\'NSWindow?\' interface type=\'NSWindow?\' access=internal @objc readImpl=stored writeImpl=stored readWriteImpl=stored\n      (accessor_decl implicit range=[/@@@/AppDelegate.swift:14:24 - line:14:24] \'@@@\' interface type=\'(AppDelegate) -> () -> NSWindow?\' access=internal @objc get_for=window\n        (parameter \"self\" interface type=\'AppDelegate\')\n        (parameter_list)\n        (brace_stmt implicit range=[/@@@/AppDelegate.swift:14:24 - line:14:24]\n          (return_stmt implicit\n            (load_expr implicit type=\'NSWindow?\'\n              (member_ref_expr implicit type=\'@lvalue NSWindow?\' decl=MacOSSDK.(file).AppDelegate.window@/@@@/AppDelegate.swift:14:24 direct_to_storage\n                (declref_expr implicit type=\'AppDelegate\' decl=MacOSSDK.(file).AppDelegate.<anonymous>.self@/@@@/AppDelegate.swift:14:24 function_ref=unapplied))))))\n      (accessor_decl implicit range=[/@@@/AppDelegate.swift:14:24 - line:14:24] \'@@@\' interface type=\'(AppDelegate) -> (NSWindow?) -> ()\' access=internal @objc set_for=window\n        (parameter \"self\" interface type=\'AppDelegate\')\n        (parameter_list\n          (parameter \"value\" interface type=\'NSWindow?\') range=[/@@@/AppDelegate.swift:14:24 - line:14:24])\n        (brace_stmt implicit range=[/@@@/AppDelegate.swift:14:24 - line:14:24]\n          (assign_expr implicit type=\'()\'\n            (member_ref_expr implicit type=\'@lvalue NSWindow?\' decl=MacOSSDK.(file).AppDelegate.window@/@@@/AppDelegate.swift:14:24 direct_to_storage\n              (declref_expr implicit type=\'AppDelegate\' decl=MacOSSDK.(file).AppDelegate.<anonymous>.self@/@@@/AppDelegate.swift:14:24 function_ref=unapplied))\n            (declref_expr implicit type=\'NSWindow?\' decl=MacOSSDK.(file).AppDelegate.<anonymous>.value@/@@@/AppDelegate.swift:14:24 function_ref=unapplied))))\n      (accessor_decl implicit range=[/@@@/AppDelegate.swift:14:24 - line:14:24] \'@@@\' interface type=\'(AppDelegate) -> () -> ()\' access=internal _modify_for=window\n        (parameter \"self\" interface type=\'AppDelegate\')\n        (parameter_list)\n        (brace_stmt implicit range=[/@@@/AppDelegate.swift:14:24 - line:14:24]\n          (yield_stmt implicit range=[/@@@/AppDelegate.swift:14:24 - line:14:24]\n            (inout_expr implicit type=\'inout NSWindow?\'\n              (member_ref_expr implicit type=\'@lvalue NSWindow?\' decl=MacOSSDK.(file).AppDelegate.window@/@@@/AppDelegate.swift:14:24 direct_to_impl\n                (declref_expr implicit type=\'AppDelegate\' decl=MacOSSDK.(file).AppDelegate.<anonymous>.self@/@@@/AppDelegate.swift:14:24 function_ref=unapplied)))))))\n    (accessor_decl implicit range=[/@@@/AppDelegate.swift:14:24 - line:14:24] \'@@@\' interface type=\'(AppDelegate) -> () -> NSWindow?\' access=internal @objc get_for=window\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list)\n      (brace_stmt implicit range=[/@@@/AppDelegate.swift:14:24 - line:14:24]\n        (return_stmt implicit\n          (load_expr implicit type=\'NSWindow?\'\n            (member_ref_expr implicit type=\'@lvalue NSWindow?\' decl=MacOSSDK.(file).AppDelegate.window@/@@@/AppDelegate.swift:14:24 direct_to_storage\n              (declref_expr implicit type=\'AppDelegate\' decl=MacOSSDK.(file).AppDelegate.<anonymous>.self@/@@@/AppDelegate.swift:14:24 function_ref=unapplied))))))\n    (accessor_decl implicit range=[/@@@/AppDelegate.swift:14:24 - line:14:24] \'@@@\' interface type=\'(AppDelegate) -> (NSWindow?) -> ()\' access=internal @objc set_for=window\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list\n        (parameter \"value\" interface type=\'NSWindow?\') range=[/@@@/AppDelegate.swift:14:24 - line:14:24])\n      (brace_stmt implicit range=[/@@@/AppDelegate.swift:14:24 - line:14:24]\n        (assign_expr implicit type=\'()\'\n          (member_ref_expr implicit type=\'@lvalue NSWindow?\' decl=MacOSSDK.(file).AppDelegate.window@/@@@/AppDelegate.swift:14:24 direct_to_storage\n            (declref_expr implicit type=\'AppDelegate\' decl=MacOSSDK.(file).AppDelegate.<anonymous>.self@/@@@/AppDelegate.swift:14:24 function_ref=unapplied))\n          (declref_expr implicit type=\'NSWindow?\' decl=MacOSSDK.(file).AppDelegate.<anonymous>.value@/@@@/AppDelegate.swift:14:24 function_ref=unapplied))))\n    (accessor_decl implicit range=[/@@@/AppDelegate.swift:14:24 - line:14:24] \'@@@\' interface type=\'(AppDelegate) -> () -> ()\' access=internal _modify_for=window\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list)\n      (brace_stmt implicit range=[/@@@/AppDelegate.swift:14:24 - line:14:24]\n        (yield_stmt implicit range=[/@@@/AppDelegate.swift:14:24 - line:14:24]\n          (inout_expr implicit type=\'inout NSWindow?\'\n            (member_ref_expr implicit type=\'@lvalue NSWindow?\' decl=MacOSSDK.(file).AppDelegate.window@/@@@/AppDelegate.swift:14:24 direct_to_impl\n              (declref_expr implicit type=\'AppDelegate\' decl=MacOSSDK.(file).AppDelegate.<anonymous>.self@/@@@/AppDelegate.swift:14:24 function_ref=unapplied))))))\n    (func_decl range=[/@@@/AppDelegate.swift:16:5 - line:18:5] \"applicationDidFinishLaunching(_:)\" interface type=\'(AppDelegate) -> (Notification) -> ()\' access=internal @objc\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list\n        (parameter \"aNotification\" type=\'Notification\' interface type=\'Notification\') range=[/@@@/AppDelegate.swift:16:39 - line:16:69])\n      (brace_stmt range=[/@@@/AppDelegate.swift:16:71 - line:18:5]))\n    (func_decl range=[/@@@/AppDelegate.swift:20:5 - line:22:5] \"applicationWillTerminate(_:)\" interface type=\'(AppDelegate) -> (Notification) -> ()\' access=internal @objc\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list\n        (parameter \"aNotification\" type=\'Notification\' interface type=\'Notification\') range=[/@@@/AppDelegate.swift:20:34 - line:20:64])\n      (brace_stmt range=[/@@@/AppDelegate.swift:20:66 - line:22:5]))\n    (constructor_decl implicit range=[/@@@/AppDelegate.swift:12:52 - line:12:52] \"init()\" interface type=\'(AppDelegate.Type) -> () -> AppDelegate\' access=internal override=ObjectiveC.(file).NSObject.init() @objc dynamic designated\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list)\n      (brace_stmt implicit\n        (rebind_self_in_constructor_expr implicit type=\'()\'\n          (call_expr implicit type=\'NSObject\' nothrow arg_labels=\n            (dot_syntax_call_expr implicit type=\'() -> NSObject\' super nothrow\n              (other_constructor_ref_expr implicit type=\'(NSObject) -> () -> NSObject\' decl=ObjectiveC.(file).NSObject.init())\n              (super_ref_expr implicit type=\'NSObject\'))\n            (tuple_expr implicit type=\'()\')))\n        (return_stmt implicit)))\n    (destructor_decl implicit range=[/@@@/AppDelegate.swift:12:7 - line:12:7] \"deinit\" interface type=\'(AppDelegate) -> () -> ()\' access=internal @objc\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list)\n      (brace_stmt implicit range=[/@@@/AppDelegate.swift:12:7 - line:12:7]))))")
                                                    expectation.fulfill()
        })
    }

    func testIOSASTForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "iOSSDK",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme": "iOSSDK",
                                                           "target": "iOSSDK"],
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.generatingAST,
                                                 statusUpdateValidationHandler: { (_, additionalInformation, expectation) in
                                                    guard let additionalInformation = additionalInformation else {
                                                        XCTFail()
                                                        return
                                                    }
                                                    let sourceFileStrings = additionalInformation.losslessComponents(beginningWith: "(source_file").sorted()
                                                    XCTStringMatchesPattern(string: sourceFileStrings[0], pattern: "(source_file \"/@@@/AppDelegate.swift\"\n  (import_decl range=[/@@@/AppDelegate.swift:9:1 - line:9:8] \'UIKit\')\n  (class_decl range=[/@@@/AppDelegate.swift:12:1 - line:43:1] \"AppDelegate\" interface type=\'AppDelegate.Type\' access=internal @objc non-resilient inherits: UIResponder, UIApplicationDelegate\n    (pattern_binding_decl range=[/@@@/AppDelegate.swift:14:5 - line:14:25]\n      (pattern_typed type=\'UIWindow?\'\n        (pattern_named type=\'UIWindow?\' \'window\')\n)\n      (dot_syntax_call_expr implicit type=\'UIWindow?\' nothrow\n        (declref_expr implicit type=\'(UIWindow?.Type) -> UIWindow?\' decl=Swift.(file).Optional.none [with (substitution_map generic_signature=<Wrapped> (substitution Wrapped -> UIWindow))] function_ref=unapplied)\n        (type_expr implicit type=\'UIWindow?.Type\' typerepr=\'<<NULL>>\')))\n    (var_decl range=[/@@@/AppDelegate.swift:14:9 - line:14:9] \"window\" type=\'UIWindow?\' interface type=\'UIWindow?\' access=internal @objc readImpl=stored writeImpl=stored readWriteImpl=stored\n      (accessor_decl implicit range=[/@@@/AppDelegate.swift:14:9 - line:14:9] \'@@@\' interface type=\'(AppDelegate) -> () -> UIWindow?\' access=internal @objc get_for=window\n        (parameter \"self\" interface type=\'AppDelegate\')\n        (parameter_list)\n        (brace_stmt implicit range=[/@@@/AppDelegate.swift:14:9 - line:14:9]\n          (return_stmt implicit\n            (load_expr implicit type=\'UIWindow?\'\n              (member_ref_expr implicit type=\'@lvalue UIWindow?\' decl=iOSSDK.(file).AppDelegate.window@/@@@/AppDelegate.swift:14:9 direct_to_storage\n                (declref_expr implicit type=\'AppDelegate\' decl=iOSSDK.(file).AppDelegate.<anonymous>.self@/@@@/AppDelegate.swift:14:9 function_ref=unapplied))))))\n      (accessor_decl implicit range=[/@@@/AppDelegate.swift:14:9 - line:14:9] \'@@@\' interface type=\'(AppDelegate) -> (UIWindow?) -> ()\' access=internal @objc set_for=window\n        (parameter \"self\" interface type=\'AppDelegate\')\n        (parameter_list\n          (parameter \"value\" interface type=\'UIWindow?\') range=[/@@@/AppDelegate.swift:14:9 - line:14:9])\n        (brace_stmt implicit range=[/@@@/AppDelegate.swift:14:9 - line:14:9]\n          (assign_expr implicit type=\'()\'\n            (member_ref_expr implicit type=\'@lvalue UIWindow?\' decl=iOSSDK.(file).AppDelegate.window@/@@@/AppDelegate.swift:14:9 direct_to_storage\n              (declref_expr implicit type=\'AppDelegate\' decl=iOSSDK.(file).AppDelegate.<anonymous>.self@/@@@/AppDelegate.swift:14:9 function_ref=unapplied))\n            (declref_expr implicit type=\'UIWindow?\' decl=iOSSDK.(file).AppDelegate.<anonymous>.value@/@@@/AppDelegate.swift:14:9 function_ref=unapplied))))\n      (accessor_decl implicit range=[/@@@/AppDelegate.swift:14:9 - line:14:9] \'@@@\' interface type=\'(AppDelegate) -> () -> ()\' access=internal _modify_for=window\n        (parameter \"self\" interface type=\'AppDelegate\')\n        (parameter_list)\n        (brace_stmt implicit range=[/@@@/AppDelegate.swift:14:9 - line:14:9]\n          (yield_stmt implicit range=[/@@@/AppDelegate.swift:14:9 - line:14:9]\n            (inout_expr implicit type=\'inout UIWindow?\'\n              (member_ref_expr implicit type=\'@lvalue UIWindow?\' decl=iOSSDK.(file).AppDelegate.window@/@@@/AppDelegate.swift:14:9 direct_to_impl\n                (declref_expr implicit type=\'AppDelegate\' decl=iOSSDK.(file).AppDelegate.<anonymous>.self@/@@@/AppDelegate.swift:14:9 function_ref=unapplied)))))))\n    (accessor_decl implicit range=[/@@@/AppDelegate.swift:14:9 - line:14:9] \'@@@\' interface type=\'(AppDelegate) -> () -> UIWindow?\' access=internal @objc get_for=window\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list)\n      (brace_stmt implicit range=[/@@@/AppDelegate.swift:14:9 - line:14:9]\n        (return_stmt implicit\n          (load_expr implicit type=\'UIWindow?\'\n            (member_ref_expr implicit type=\'@lvalue UIWindow?\' decl=iOSSDK.(file).AppDelegate.window@/@@@/AppDelegate.swift:14:9 direct_to_storage\n              (declref_expr implicit type=\'AppDelegate\' decl=iOSSDK.(file).AppDelegate.<anonymous>.self@/@@@/AppDelegate.swift:14:9 function_ref=unapplied))))))\n    (accessor_decl implicit range=[/@@@/AppDelegate.swift:14:9 - line:14:9] \'@@@\' interface type=\'(AppDelegate) -> (UIWindow?) -> ()\' access=internal @objc set_for=window\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list\n        (parameter \"value\" interface type=\'UIWindow?\') range=[/@@@/AppDelegate.swift:14:9 - line:14:9])\n      (brace_stmt implicit range=[/@@@/AppDelegate.swift:14:9 - line:14:9]\n        (assign_expr implicit type=\'()\'\n          (member_ref_expr implicit type=\'@lvalue UIWindow?\' decl=iOSSDK.(file).AppDelegate.window@/@@@/AppDelegate.swift:14:9 direct_to_storage\n            (declref_expr implicit type=\'AppDelegate\' decl=iOSSDK.(file).AppDelegate.<anonymous>.self@/@@@/AppDelegate.swift:14:9 function_ref=unapplied))\n          (declref_expr implicit type=\'UIWindow?\' decl=iOSSDK.(file).AppDelegate.<anonymous>.value@/@@@/AppDelegate.swift:14:9 function_ref=unapplied))))\n    (accessor_decl implicit range=[/@@@/AppDelegate.swift:14:9 - line:14:9] \'@@@\' interface type=\'(AppDelegate) -> () -> ()\' access=internal _modify_for=window\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list)\n      (brace_stmt implicit range=[/@@@/AppDelegate.swift:14:9 - line:14:9]\n        (yield_stmt implicit range=[/@@@/AppDelegate.swift:14:9 - line:14:9]\n          (inout_expr implicit type=\'inout UIWindow?\'\n            (member_ref_expr implicit type=\'@lvalue UIWindow?\' decl=iOSSDK.(file).AppDelegate.window@/@@@/AppDelegate.swift:14:9 direct_to_impl\n              (declref_expr implicit type=\'AppDelegate\' decl=iOSSDK.(file).AppDelegate.<anonymous>.self@/@@@/AppDelegate.swift:14:9 function_ref=unapplied))))))\n    (func_decl range=[/@@@/AppDelegate.swift:16:5 - line:19:5] \"application(_:didFinishLaunchingWithOptions:)\" interface type=\'(AppDelegate) -> (UIApplication, [UIApplication.LaunchOptionsKey : Any]?) -> Bool\' access=internal @objc\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list\n        (parameter \"application\" type=\'UIApplication\' interface type=\'UIApplication\')\n        (parameter \"launchOptions\" apiName=didFinishLaunchingWithOptions type=\'[UIApplication.LaunchOptionsKey : Any]?\' interface type=\'[UIApplication.LaunchOptionsKey : Any]?\') range=[/@@@/AppDelegate.swift:16:21 - line:16:135])\n      (result\n        (type_ident\n          (component id=\'Bool\' bind=Swift.(file).Bool)))\n      (brace_stmt range=[/@@@/AppDelegate.swift:16:145 - line:19:5]\n        (return_stmt range=[/@@@/AppDelegate.swift:18:9 - line:18:16]\n          (call_expr implicit type=\'Bool\' location=/@@@/AppDelegate.swift:18:16 range=[/@@@/AppDelegate.swift:18:16 - line:18:16] nothrow arg_labels=_builtinBooleanLiteral:\n            (constructor_ref_call_expr implicit type=\'(Int1) -> Bool\' location=/@@@/AppDelegate.swift:18:16 range=[/@@@/AppDelegate.swift:18:16 - line:18:16] nothrow\n              (declref_expr implicit type=\'(Bool.Type) -> (Int1) -> Bool\' location=/@@@/AppDelegate.swift:18:16 range=[/@@@/AppDelegate.swift:18:16 - line:18:16] decl=Swift.(file).Bool extension.init(_builtinBooleanLiteral:) function_ref=single)\n              (type_expr implicit type=\'Bool.Type\' location=/@@@/AppDelegate.swift:18:16 range=[/@@@/AppDelegate.swift:18:16 - line:18:16] typerepr=\'Bool\'))\n            (tuple_expr implicit type=\'(_builtinBooleanLiteral: Builtin.Int1)\' location=/@@@/AppDelegate.swift:18:16 range=[/@@@/AppDelegate.swift:18:16 - line:18:16] names=_builtinBooleanLiteral\n              (boolean_literal_expr type=\'Builtin.Int1\' location=/@@@/AppDelegate.swift:18:16 range=[/@@@/AppDelegate.swift:18:16 - line:18:16] value=true))))))\n    (func_decl range=[/@@@/AppDelegate.swift:21:5 - line:24:5] \"applicationWillResignActive(_:)\" interface type=\'(AppDelegate) -> (UIApplication) -> ()\' access=internal @objc\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list\n        (parameter \"application\" type=\'UIApplication\' interface type=\'UIApplication\') range=[/@@@/AppDelegate.swift:21:37 - line:21:66])\n      (brace_stmt range=[/@@@/AppDelegate.swift:21:68 - line:24:5]))\n    (func_decl range=[/@@@/AppDelegate.swift:26:5 - line:29:5] \"applicationDidEnterBackground(_:)\" interface type=\'(AppDelegate) -> (UIApplication) -> ()\' access=internal @objc\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list\n        (parameter \"application\" type=\'UIApplication\' interface type=\'UIApplication\') range=[/@@@/AppDelegate.swift:26:39 - line:26:68])\n      (brace_stmt range=[/@@@/AppDelegate.swift:26:70 - line:29:5]))\n    (func_decl range=[/@@@/AppDelegate.swift:31:5 - line:33:5] \"applicationWillEnterForeground(_:)\" interface type=\'(AppDelegate) -> (UIApplication) -> ()\' access=internal @objc\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list\n        (parameter \"application\" type=\'UIApplication\' interface type=\'UIApplication\') range=[/@@@/AppDelegate.swift:31:40 - line:31:69])\n      (brace_stmt range=[/@@@/AppDelegate.swift:31:71 - line:33:5]))\n    (func_decl range=[/@@@/AppDelegate.swift:35:5 - line:37:5] \"applicationDidBecomeActive(_:)\" interface type=\'(AppDelegate) -> (UIApplication) -> ()\' access=internal @objc\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list\n        (parameter \"application\" type=\'UIApplication\' interface type=\'UIApplication\') range=[/@@@/AppDelegate.swift:35:36 - line:35:65])\n      (brace_stmt range=[/@@@/AppDelegate.swift:35:67 - line:37:5]))\n    (func_decl range=[/@@@/AppDelegate.swift:39:5 - line:41:5] \"applicationWillTerminate(_:)\" interface type=\'(AppDelegate) -> (UIApplication) -> ()\' access=internal @objc\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list\n        (parameter \"application\" type=\'UIApplication\' interface type=\'UIApplication\') range=[/@@@/AppDelegate.swift:39:34 - line:39:63])\n      (brace_stmt range=[/@@@/AppDelegate.swift:39:65 - line:41:5]))\n    (constructor_decl implicit range=[/@@@/AppDelegate.swift:12:55 - line:12:55] \"init()\" interface type=\'(AppDelegate.Type) -> () -> AppDelegate\' access=internal override=UIKit.(file).UIResponder.init() @objc dynamic designated\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list)\n      (brace_stmt implicit\n        (rebind_self_in_constructor_expr implicit type=\'()\'\n          (call_expr implicit type=\'UIResponder\' nothrow arg_labels=\n            (dot_syntax_call_expr implicit type=\'() -> UIResponder\' super nothrow\n              (other_constructor_ref_expr implicit type=\'(UIResponder) -> () -> UIResponder\' decl=UIKit.(file).UIResponder.init())\n              (super_ref_expr implicit type=\'UIResponder\'))\n            (tuple_expr implicit type=\'()\')))\n        (return_stmt implicit)))\n    (destructor_decl implicit range=[/@@@/AppDelegate.swift:12:7 - line:12:7] \"deinit\" interface type=\'(AppDelegate) -> () -> ()\' access=internal @objc\n      (parameter \"self\" interface type=\'AppDelegate\')\n      (parameter_list)\n      (brace_stmt implicit rang\ne=[/@@@/AppDelegate.swift:12:7 - line:12:7]))))\n")
                                                    XCTStringMatchesPattern(string: sourceFileStrings[1], pattern: "(source_file \"/@@@/ViewController.swift\"\n  (import_decl range=[/@@@/ViewController.swift:9:1 - line:9:8] \'UIKit\')\n  (class_decl range=[/@@@/ViewController.swift:11:1 - line:18:1] \"ViewController\" interface type=\'ViewController.Type\' access=internal @objc non-resilient inherits: UIViewController\n    (func_decl range=[/@@@/ViewController.swift:13:14 - line:16:5] \"viewDidLoad()\" interface type=\'(ViewController) -> () -> ()\' access=internal override=UIKit.(file).UIViewController.viewDidLoad() @objc dynamic\n      (parameter \"self\" interface type=\'ViewController\')\n      (parameter_list range=[/@@@/ViewController.swift:13:30 - line:13:31])\n      (brace_stmt range=[/@@@/ViewController.swift:13:33 - line:16:5]\n        (call_expr type=\'Void\' location=/@@@/ViewController.swift:14:15 range=[/@@@/ViewController.swift:14:9 - line:14:27] nothrow arg_labels=\n          (dot_syntax_call_expr type=\'() -> Void\' location=/@@@/ViewController.swift:14:15 range=[/@@@/ViewController.swift:14:9 - line:14:15] super nothrow\n            (declref_expr type=\'(UIViewController) -> () -> Void\' location=/@@@/ViewController.swift:14:15 range=[/@@@/ViewController.swift:14:15 - line:14:15] decl=UIKit.(file).UIViewController.viewDidLoad() function_ref=single)\n            (super_ref_expr type=\'UIViewController\' location=/@@@/ViewController.swift:14:9 range=[/@@@/ViewController.swift:14:9 - line:14:9]))\n          (tuple_expr type=\'()\' location=/@@@/ViewController.swift:14:26 range=[/@@@/ViewController.swift:14:26 - line:14:27]))))\n    (constructor_decl implicit range=[/@@@/ViewController.swift:11:40 - line:11:40] \"init(nibName:bundle:)\" interface type=\'(ViewController.Type) -> (String?, Bundle?) -> ViewController\' access=internal override=UIKit.(file).UIViewController.init(nibName:bundle:) @objc dynamic designated\n      (parameter \"self\" interface type=\'ViewController\')\n      (parameter_list\n        (parameter \"nibNameOrNil\" apiName=nibName type=\'String?\' interface type=\'String?\')\n        (parameter \"nibBundleOrNil\" apiName=bundle type=\'Bundle?\' interface type=\'Bundle?\'))\n      (brace_stmt implicit\n        (rebind_self_in_constructor_expr implicit type=\'()\'\n          (call_expr implicit type=\'UIViewController\' nothrow arg_labels=nibName:bundle:\n            (dot_syntax_call_expr implicit type=\'(String?, Bundle?) -> UIViewController\' super nothrow\n              (other_constructor_ref_expr implicit type=\'(UIViewController) -> (String?, Bundle?) -> UIViewController\' decl=UIKit.(file).UIViewController.init(nibName:bundle:))\n              (super_ref_expr implicit type=\'UIViewController\'))\n            (tuple_expr implicit type=\'(nibName: String?, bundle: Bundle?)\' names=nibName,bundle\n              (declref_expr implicit type=\'String?\' decl=iOSSDK.(file).ViewController.init(nibName:bundle:).nibNameOrNil function_ref=unapplied)\n              (declref_expr implicit type=\'Bundle?\' decl=iOSSDK.(file).ViewController.init(nibName:bundle:).nibBundleOrNil function_ref=unapplied))))\n        (return_stmt implicit)))\n    (constructor_decl implicit range=[/@@@/ViewController.swift:11:40 - line:11:40] \"init(coder:)\" interface type=\'(ViewController.Type) -> (NSCoder) -> ViewController?\' access=internal override=UIKit.(file).UIViewController.init(coder:) @objc dynamic required designated failable=Optional\n      (parameter \"self\" interface type=\'ViewController\')\n      (parameter_list\n        (parameter \"aDecoder\" apiName=coder type=\'NSCoder\' interface type=\'NSCoder\'))\n      (brace_stmt implicit\n        (rebind_self_in_constructor_expr implicit type=\'()\'\n          (call_expr implicit type=\'UIViewController?\' nothrow arg_labels=coder:\n            (dot_syntax_call_expr implicit type=\'(NSCoder) -> UIViewController?\' super nothrow\n              (other_constructor_ref_expr implicit type=\'(UIViewController) -> (NSCoder) -> UIViewController?\' decl=UIKit.(file).UIViewController.init(coder:))\n              (super_ref_expr implicit type=\'UIViewController\'))\n            (tuple_expr implicit type=\'(coder: NSCoder)\' names=coder\n              (declref_expr implicit type=\'NSCoder\' decl=iOSSDK.(file).ViewController.init(coder:).aDecoder function_ref=unapplied))))\n        (return_stmt implicit)))\n    (destructor_decl implicit range=[/@@@/ViewController.swift:11:7 - line:11:7] \"deinit\" interface type=\'(ViewController) -> () -> ()\' access=internal @objc\n      (parameter \"self\" interface type=\'ViewController\')\n      (parameter_list)\n      (brace_stmt implicit range=[/@@@/ViewController.swift:11:7 - line:11:7]))))")
                                                    expectation.fulfill()
        })
    }

}
