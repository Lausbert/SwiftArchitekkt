//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTests {
        
    func testNoTargetForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "NoTarget",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme":"AnyScheme"],
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.updatingGraphRequest,
                                                 completionValidationHandler: { (result, expectation) in
                                                    switch result {
                                                    case .success(_, _), .decisionNeeded(_, _):
                                                        XCTFail()
                                                    case .failure(_, let error):
                                                        XCTEqualAfterCasting(error, toTypeOf: XcodeBuildWrapper.ErrorEnum.couldNotFindAnyTargets("xcodebuild: error: The project named \"NoTarget\" does not contain a scheme named \"AnyScheme\". The \"-list\" option can be used to find the names of the schemes in the project.\n"))
                                                        expectation.fulfill()
                                                    }
        })
    }
    
    func testSingleTargetForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "SingleTarget",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme":"SingleTarget"],
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.updatingGraphRequest,
                                                 statusUpdateValidationHandler: { (graphRequest, _, expectation) in
                                                    if let target = graphRequest.options["target"] {
                                                        XCTAssert(target == "SingleTarget")
                                                    } else {
                                                        XCTFail()
                                                    }
                                                    expectation.fulfill()
        })
    }
    
    func testMultipleTargetsForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "MultipleTargets",
                                                 pathExtension: "xcodeproj",
                                                 options: ["scheme":"MultipleTargets"],
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.updatingGraphRequest,
                                                 completionValidationHandler: { (result, expectation) in
                                                    switch result {
                                                    case .success(_, _), .failure(_, _):
                                                        XCTFail()
                                                    case .decisionNeeded(_, let options):
                                                        if let targets = options["target"] {
                                                            XCTAssert(targets.contains("FirstTarget"))
                                                            XCTAssert(targets.contains("SecondTarget"))
                                                            XCTAssert(targets.count == 2)
                                                        } else {
                                                            XCTFail()
                                                        }
                                                        expectation.fulfill()
                                                    }
        })
    }
    
}
