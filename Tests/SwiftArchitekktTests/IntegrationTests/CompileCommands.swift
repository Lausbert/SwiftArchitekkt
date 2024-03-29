//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTest {

    func testMacOSCompileCommandsForProject() {
        testNodeRequestHandlingForRessourceFile(withName: "MacOSSDK",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme": "MacOSSDK"],
                                                 lastProcedure: SwiftNodeRequestHandler.LastProcedure.generatingCompileCommands,
                                                 statusUpdateValidationHandler: { (_, additionalInformation, expectation) in
                                                    guard let additionalInformation = additionalInformation else {
                                                        XCTFail()
                                                        return
                                                    }
                                                    XCTStringMatchesPattern(string: additionalInformation, pattern: "[SwiftArchitekkt.XcodeBuildWrapper.Result(moduleName: \"MacOSSDK\", compileCommands: [\"-module-name\", \"MacOSSDK\", \"-Onone\", \"-enable-batch-mode\", \"-enforce-exclusivity=checked\", \"@@@/MacOSSDK.SwiftFileList\", \"-DDEBUG\", \"-sdk\", \"@@@/MacOSX@@@.sdk\", \"-target\", \"@@@\", \"-g\", \"-module-cache-path\", \"@@@/ModuleCache.noindex\", \"-Xfrontend\", \"-serialize-debugging-options\", \"-enable-testing\", \"-index-store-path\", \"@@@/DataStore\", \"-swift-version\", \"@@@\", \"-I\", \"@@@/Debug\", \"-F\", \"@@@/Debug\", \"-parse-as-library\", \"-j@@@\", \"-output-file-map\", \"@@@/MacOSSDK-OutputFileMap.json\", \"-serialize-diagnostics\", \"-Xcc\", \"@@@/swift-overrides.hmap\", \"-Xcc\", \"-iquote\", \"-Xcc\", \"@@@/MacOSSDK-generated-files.hmap\", \"-Xcc\", \"@@@/MacOSSDK-own-target-headers.hmap\", \"-Xcc\", \"@@@/MacOSSDK-all-target-headers.hmap\", \"-Xcc\", \"-iquote\", \"-Xcc\", \"@@@/MacOSSDK-project-headers.hmap\", \"-Xcc\", \"@@@/include\", \"-Xcc\", \"@@@/@@@\", \"-Xcc\", \"@@@/@@@\", \"-Xcc\", \"@@@/DerivedSources\", \"-Xcc\", \"-DDEBUG=1\", \"-working-directory\", \"@@@/MacOSSDK\", \"-dump-ast\"])]")
                                                    expectation.fulfill()
        })
    }

    func testIOSCompileCommandsForProject() {
        testNodeRequestHandlingForRessourceFile(withName: "iOSSDK",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme": "iOSSDK"],
                                                 lastProcedure: SwiftNodeRequestHandler.LastProcedure.generatingCompileCommands,
                                                 statusUpdateValidationHandler: { (_, additionalInformation, expectation) in
                                                    guard let additionalInformation = additionalInformation else {
                                                        XCTFail()
                                                        return
                                                    }
                                                    XCTStringMatchesPattern(string: additionalInformation, pattern: "[SwiftArchitekkt.XcodeBuildWrapper.Result(moduleName: \"iOSSDK\", compileCommands: [\"-module-name\", \"iOSSDK\", \"-Onone\", \"-enable-batch-mode\", \"-enforce-exclusivity=checked\", \"@@@/iOSSDK.SwiftFileList\", \"-DDEBUG\", \"-sdk\", \"@@@/iPhoneOS@@@.sdk\", \"-target\", \"arm64-apple-@@@\", \"-g\", \"-module-cache-path\", \"@@@/ModuleCache.noindex\", \"-Xfrontend\", \"-serialize-debugging-options\", \"-enable-testing\", \"-index-store-path\", \"@@@/DataStore\", \"-swift-version\", \"@@@\", \"-I\", \"@@@/Debug-iphoneos\", \"-F\", \"@@@/Debug-iphoneos\", \"-j@@@\", \"-output-file-map\", \"@@@/iOSSDK-OutputFileMap.json\", \"-serialize-diagnostics\", \"-Xcc\", \"@@@/swift-overrides.hmap\", \"-Xcc\", \"-iquote\", \"-Xcc\", \"@@@/iOSSDK-generated-files.hmap\", \"-Xcc\", \"@@@/iOSSDK-own-target-headers.hmap\", \"-Xcc\", \"@@@/iOSSDK-all-target-headers.hmap\", \"-Xcc\", \"-iquote\", \"-Xcc\", \"@@@/iOSSDK-project-headers.hmap\", \"-Xcc\", \"@@@/include\", \"-Xcc\", \"@@@/arm64\", \"-Xcc\", \"@@@/arm64\", \"-Xcc\", \"@@@/DerivedSources\", \"-Xcc\", \"-DDEBUG=1\", \"-working-directory\", \"@@@/iOSSDK\", \"-dump-ast\"])]")
                                                    expectation.fulfill()
        })
    }

}
