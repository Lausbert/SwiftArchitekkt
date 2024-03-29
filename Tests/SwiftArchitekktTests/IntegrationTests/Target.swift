//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTest {

    func testSingleTargetForProject() {
        testNodeRequestHandlingForRessourceFile(withName: "SingleTarget",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme": "SingleTarget"],
                                                 lastProcedure: SwiftNodeRequestHandler.LastProcedure.generatingCompileCommands,
                                                 statusUpdateValidationHandler: { (_, additionalInformation, expectation) in
                                                    guard let additionalInformation = additionalInformation else {
                                                        XCTFail()
                                                        return
                                                    }
                                                    XCTStringMatchesPattern(string: additionalInformation, pattern: "[SwiftArchitekkt.XcodeBuildWrapper.Result(moduleName: \"SingleTarget\", compileCommands: [\"-module-name\", \"SingleTarget\", \"-Onone\", \"-enable-batch-mode\", \"-enforce-exclusivity=checked\", \"@@@/SingleTarget.SwiftFileList\", \"-DDEBUG\", \"-sdk\", \"@@@/MacOSX@@@.sdk\", \"-target\", \"@@@\", \"-g\", \"-module-cache-path\", \"@@@/ModuleCache.noindex\", \"-Xfrontend\", \"-serialize-debugging-options\", \"-enable-testing\", \"-index-store-path\", \"@@@/DataStore\", \"-swift-version\", \"@@@\", \"-I\", \"@@@/Debug\", \"-F\", \"@@@/Debug\", \"-parse-as-library\", \"-j@@@\", \"-output-file-map\", \"@@@/SingleTarget-OutputFileMap.json\", \"-serialize-diagnostics\", \"-Xcc\", \"@@@/swift-overrides.hmap\", \"-Xcc\", \"-iquote\", \"-Xcc\", \"@@@/SingleTarget-generated-files.hmap\", \"-Xcc\", \"@@@/SingleTarget-own-target-headers.hmap\", \"-Xcc\", \"@@@/SingleTarget-all-target-headers.hmap\", \"-Xcc\", \"-iquote\", \"-Xcc\", \"@@@/SingleTarget-project-headers.hmap\", \"-Xcc\", \"@@@/include\", \"-Xcc\", \"@@@/@@@\", \"-Xcc\", \"@@@/@@@\", \"-Xcc\", \"@@@/DerivedSources\", \"-Xcc\", \"-DDEBUG=1\", \"-working-directory\", \"@@@/SingleTarget\", \"-dump-ast\"])]")
                                                    expectation.fulfill()
        })
    }

    func testMultipleTargetsForProject() {
        testNodeRequestHandlingForRessourceFile(withName: "MultipleTargets",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme": "MultipleTargets"],
                                                 lastProcedure: SwiftNodeRequestHandler.LastProcedure.generatingCompileCommands,
                                                 statusUpdateValidationHandler: { (_, additionalInformation, expectation) in
                                                    guard let additionalInformation = additionalInformation else {
                                                        XCTFail()
                                                        return
                                                    }
                                                    XCTStringMatchesPattern(string: additionalInformation, pattern: "[SwiftArchitekkt.XcodeBuildWrapper.Result(moduleName: \"FirstTarget\", compileCommands: [\"-module-name\", \"FirstTarget\", \"-Onone\", \"-enable-batch-mode\", \"-enforce-exclusivity=checked\", \"@@@/FirstTarget.SwiftFileList\", \"-DDEBUG\", \"-sdk\", \"@@@/MacOSX@@@.sdk\", \"-target\", \"@@@\", \"-g\", \"-module-cache-path\", \"@@@/ModuleCache.noindex\", \"-Xfrontend\", \"-serialize-debugging-options\", \"-enable-testing\", \"-index-store-path\", \"@@@/DataStore\", \"-swift-version\", \"@@@\", \"-I\", \"@@@/Debug\", \"-F\", \"@@@/Debug\", \"-parse-as-library\", \"-j@@@\", \"-output-file-map\", \"@@@/FirstTarget-OutputFileMap.json\", \"-serialize-diagnostics\", \"-Xcc\", \"@@@/swift-overrides.hmap\", \"-Xcc\", \"-iquote\", \"-Xcc\", \"@@@/FirstTarget-generated-files.hmap\", \"-Xcc\", \"@@@/FirstTarget-own-target-headers.hmap\", \"-Xcc\", \"@@@/FirstTarget-all-target-headers.hmap\", \"-Xcc\", \"-iquote\", \"-Xcc\", \"@@@/FirstTarget-project-headers.hmap\", \"-Xcc\", \"@@@/include\", \"-Xcc\", \"@@@/@@@\", \"-Xcc\", \"@@@/@@@\", \"-Xcc\", \"@@@/DerivedSources\", \"-Xcc\", \"-DDEBUG=1\", \"-working-directory\", \"@@@/MultipleTargets\", \"-dump-ast\"]), SwiftArchitekkt.XcodeBuildWrapper.Result(moduleName: \"SecondTarget\", compileCommands: [\"-module-name\", \"SecondTarget\", \"-Onone\", \"-enable-batch-mode\", \"-enforce-exclusivity=checked\", \"@@@/SecondTarget.SwiftFileList\", \"-DDEBUG\", \"-sdk\", \"@@@/MacOSX@@@.sdk\", \"-target\", \"@@@\", \"-g\", \"-module-cache-path\", \"@@@/ModuleCache.noindex\", \"-Xfrontend\", \"-serialize-debugging-options\", \"-enable-testing\", \"-index-store-path\", \"@@@/DataStore\", \"-swift-version\", \"@@@\", \"-I\", \"@@@/Debug\", \"-F\", \"@@@/Debug\", \"-parse-as-library\", \"-j@@@\", \"-output-file-map\", \"@@@/SecondTarget-OutputFileMap.json\", \"-serialize-diagnostics\", \"-Xcc\", \"@@@/swift-overrides.hmap\", \"-Xcc\", \"-iquote\", \"-Xcc\", \"@@@/SecondTarget-generated-files.hmap\", \"-Xcc\", \"@@@/SecondTarget-own-target-headers.hmap\", \"-Xcc\", \"@@@/SecondTarget-all-target-headers.hmap\", \"-Xcc\", \"-iquote\", \"-Xcc\", \"@@@/SecondTarget-project-headers.hmap\", \"-Xcc\", \"@@@/include\", \"-Xcc\", \"@@@/@@@\", \"-Xcc\", \"@@@/@@@\", \"-Xcc\", \"@@@/DerivedSources\", \"-Xcc\", \"-DDEBUG=1\", \"-working-directory\", \"@@@/MultipleTargets\", \"-dump-ast\"])]")
                                                    expectation.fulfill()
        })
    }

}
