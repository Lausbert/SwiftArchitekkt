//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTest {

    func testSchemeForMissingProject() {
        testGraphRequestHandlingForRessourceFile(withName: "MissingProject",
                                                 pathExtension: "xcodeproj",
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.updatingGraphRequest,
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
        testGraphRequestHandlingForRessourceFile(withName: "NoScheme",
                                                 pathExtension: "xcodeproj",
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.updatingGraphRequest,
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
        testGraphRequestHandlingForRessourceFile(withName: "SingleScheme",
                                                 pathExtension: "xcodeproj",
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.updatingGraphRequest,
                                                 statusUpdateValidationHandler: { (graphRequest, _, expectation) in
                                                    if let scheme = graphRequest.options["scheme"] {
                                                        XCTAssert(scheme == "SingleScheme")
                                                    } else {
                                                        XCTFail()
                                                    }
                                                    expectation.fulfill()
        })
    }

    func testMultipleSchemesForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "MultipleSchemes",
                                                 pathExtension: "xcodeproj",
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.updatingGraphRequest,
                                                 completionValidationHandler: { (result, expectation) in
                                                    switch result {
                                                    case .success, .failure:
                                                        XCTFail()
                                                    case .decisionNeeded(_, let options):
                                                        if let schemes = options["scheme"] {
                                                            XCTAssert(schemes.contains("FirstScheme"))
                                                            XCTAssert(schemes.contains("SecondScheme"))
                                                            XCTAssert(schemes.count == 2)
                                                        } else {
                                                            XCTFail()
                                                        }
                                                        expectation.fulfill()
                                                    }
        })
    }

    func testMultipleSchemesWithWhitespaceForProject() {
        testGraphRequestHandlingForRessourceFile(withName: "MultipleSchemesWithWhitespace",
                                                 pathExtension: "xcodeproj",
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.updatingGraphRequest,
                                                 completionValidationHandler: { (result, expectation) in
                                                    switch result {
                                                    case .success, .failure:
                                                        XCTFail()
                                                    case .decisionNeeded(_, let options):
                                                        if let schemes = options["scheme"] {
                                                            XCTAssert(schemes.contains("First Scheme"))
                                                            XCTAssert(schemes.contains("Second Scheme"))
                                                            XCTAssert(schemes.count == 2)
                                                        } else {
                                                            XCTFail()
                                                        }
                                                        expectation.fulfill()
                                                    }
        })
    }

}
