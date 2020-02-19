//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTests {

    func testNoTargetForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "NoTarget",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme": "AnyScheme"],
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.generatingCompileCommands,
                                                 completionValidationHandler: { (result, expectation) in
                                                    switch result {
                                                    case .success, .decisionNeeded:
                                                        XCTFail()
                                                    case .failure(_, let error):
                                                        XCTEqualAfterCasting(error, toTypeOf: XcodeBuildWrapper.ErrorEnum.couldNotFindAnyCompileCommands("xcodebuild: error: Scheme AnyScheme is not currently configured for the clean action.\n\n"))
                                                        expectation.fulfill()
                                                    }
        })
    }

    func testSingleTargetForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "SingleTarget",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme": "SingleTarget"],
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.generatingCompileCommands,
                                                 statusUpdateValidationHandler: { (graphRequest, additionalInformation, expectation) in
                                                    // future test here
        })
    }

    func testMultipleTargetsForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "MultipleTargets",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme": "MultipleTargets"],
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.generatingCompileCommands,
                                                 statusUpdateValidationHandler: { (graphRequest, additionalInformation, expectation) in
                                                    // future test here
        })
    }

}
