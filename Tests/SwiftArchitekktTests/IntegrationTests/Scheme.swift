//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTest {

    func testSchemeForMissingProject() {
        testNodeRequestHandlingForRessourceFile(withName: "MissingProject",
                                                 pathExtension: "xcodeproj",
                                                 lastProcedure: SwiftNodeRequestHandler.LastProcedure.updatingNodeRequest,
                                                 completionValidationHandler: { (result, expectation) in
                                                    switch result {
                                                    case .success, .decisionNeeded:
                                                        XCTFail()
                                                    case .failure(_, let error):
                                                        if let error = error as? XcodeBuildWrapper.ErrorEnum, case XcodeBuildWrapper.ErrorEnum.couldNotFindAnySchemes = error {
                                                            expectation.fulfill()
                                                        } else {
                                                            XCTFail()
                                                        }
                                                    }
        })
    }

    func testNoSchemeForProject() {
        testNodeRequestHandlingForRessourceFile(withName: "NoScheme",
                                                 pathExtension: "xcodeproj",
                                                 lastProcedure: SwiftNodeRequestHandler.LastProcedure.updatingNodeRequest,
                                                 completionValidationHandler: { (result, expectation) in
                                                    switch result {
                                                    case .success, .decisionNeeded:
                                                        XCTFail()
                                                    case .failure(_, let error):
                                                        if let error = error as? XcodeBuildWrapper.ErrorEnum, case XcodeBuildWrapper.ErrorEnum.couldNotFindAnySchemes = error {
                                                            expectation.fulfill()
                                                        } else {
                                                            XCTFail()
                                                        }
                                                    }
        })
    }

    func testSingleSchemeForProject() {
        testNodeRequestHandlingForRessourceFile(withName: "SingleScheme",
                                                 pathExtension: "xcodeproj",
                                                 lastProcedure: SwiftNodeRequestHandler.LastProcedure.updatingNodeRequest,
                                                 statusUpdateValidationHandler: { (nodeRequest, _, expectation) in
                                                    if let scheme = nodeRequest.options["scheme"] {
                                                        XCTAssert(scheme == "SingleScheme")
                                                    } else {
                                                        XCTFail()
                                                    }
                                                    expectation.fulfill()
        })
    }

    func testMultipleSchemesForProject() {
        testNodeRequestHandlingForRessourceFile(withName: "MultipleSchemes",
                                                 pathExtension: "xcodeproj",
                                                 lastProcedure: SwiftNodeRequestHandler.LastProcedure.updatingNodeRequest,
                                                 completionValidationHandler: { (result, expectation) in
                                                    switch result {
                                                    case .success, .failure:
                                                        XCTFail()
                                                    case .decisionNeeded(_, let options):
                                                        XCTAssertEqual(options.0, "scheme")
                                                        XCTAssert(options.1.contains("FirstScheme"))
                                                        XCTAssert(options.1.contains("SecondScheme"))
                                                        XCTAssert(options.1.count == 2)
                                                        expectation.fulfill()
                                                    }
        })
    }

    func testMultipleSchemesWithWhitespaceForProject() {
        testNodeRequestHandlingForRessourceFile(withName: "MultipleSchemesWithWhitespace",
                                                 pathExtension: "xcodeproj",
                                                 lastProcedure: SwiftNodeRequestHandler.LastProcedure.updatingNodeRequest,
                                                 completionValidationHandler: { (result, expectation) in
                                                    switch result {
                                                    case .success, .failure:
                                                        XCTFail()
                                                    case .decisionNeeded(_, let options):
                                                        XCTAssertEqual(options.0, "scheme")
                                                        XCTAssert(options.1.contains("First Scheme"))
                                                        XCTAssert(options.1.contains("Second Scheme"))
                                                        XCTAssert(options.1.count == 2)
                                                        expectation.fulfill()
                                                    }
        })
    }

}
