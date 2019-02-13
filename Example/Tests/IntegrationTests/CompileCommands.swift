//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTests {
        
    func testMacOSCompileCommandsForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "MacOSSDK",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme":"MacOSSDK",
                                                           "target":"MacOSSDK"],
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.generatingCompileCommands,
                                                 statusUpdateValidationHandler: { (_, additionalInformation, expectation) in
                                                    guard let additionalInformation = additionalInformation else {
                                                        XCTFail()
                                                        return
                                                    }
                                                    XCTStringMatchesPattern(string: additionalInformation, pattern: "swiftc -module-name MacOSSDK -Onone -enable-batch-mode -enforce-exclusivity=checked -DDEBUG -sdk @@@MacOSX@@@.sdk -target x86_64-apple-macosx@@@ -g -module-cache-path @@@/ModuleCache.noindex -Xfrontend -serialize-debugging-options -enable-testing -index-store-path @@@/DataStore -swift-version @@@ -I @@@/Debug -F @@@/Debug -parse-as-library -j@@@ @@@/AppDelegate.swift -output-file-map @@@/MacOSSDK-OutputFileMap.json -serialize-diagnostics -Xcc @@@/swift-overrides.hmap -Xcc -iquote -Xcc @@@/MacOSSDK-generated-files.hmap -Xcc @@@/MacOSSDK-own-target-headers.hmap -Xcc @@@/MacOSSDK-all-target-headers.hmap -Xcc -iquote -Xcc @@@/MacOSSDK-project-headers.hmap -Xcc @@@/include -Xcc -@@@/x86_64 -Xcc @@@/DerivedSources -Xcc -DDEBUG=1 -working-directory @@@/MacOSSDK -dump-ast")
                                                    expectation.fulfill()
        })
    }
    
    func testIOSCompileCommandsForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "iOSSDK",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme":"iOSSDK",
                                                           "target":"iOSSDK"],
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.generatingCompileCommands,
                                                 statusUpdateValidationHandler: { (_, additionalInformation, expectation) in
                                                    guard let additionalInformation = additionalInformation else {
                                                        XCTFail()
                                                        return
                                                    }
                                                    XCTStringMatchesPattern(string: additionalInformation, pattern: "swiftc -module-name iOSSDK -Onone -enable-batch-mode -enforce-exclusivity=checked -DDEBUG -sdk @@@/iPhoneOS@@@.sdk -target arm64-apple-@@@ -g -module-cache-path @@@/ModuleCache.noindex -Xfrontend -serialize-debugging-options -enable-testing -index-store-path @@@/DataStore -swift-version @@@ -I @@@/Debug-iphoneos -F @@@/Debug-iphoneos -j@@@ @@@/ViewController.swift @@@/AppDelegate.swift -output-file-map @@@/iOSSDK-OutputFileMap.json -serialize-diagnostics -Xcc @@@/swift-overrides.hmap -Xcc -iquote -Xcc @@@/iOSSDK-generated-files.hmap -Xcc @@@/iOSSDK-own-target-headers.hmap -Xcc @@@/iOSSDK-all-target-headers.hmap -Xcc -iquote -Xcc @@@/iOSSDK-project-headers.hmap -Xcc @@@/include -Xcc @@@/arm64 -Xcc @@@/DerivedSources -Xcc -DDEBUG=1 -working-directory @@@/iOSSDK -dump-ast")
                                                    expectation.fulfill()
        })
    }
    
}
