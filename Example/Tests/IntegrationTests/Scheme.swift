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
                                                        let url = getUrlForRessourceFile(withName: "MissingProject", pathExtension: "xcodeproj").absoluteString.replacingOccurrences(of: "file://", with: "")
                                                        XCTEqualAfterCasting(error, toTypeOf: XcodeBuildWrapper.ErrorEnum.couldNotFindAnySchemes("Command line invocation:\n    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild -list -project \(url)\n\nxcodebuild: error: \'\(url)\' does not exist.\n"))
                                                        expectation.fulfill()
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
                                                        let url = getUrlForRessourceFile(withName: "NoScheme", pathExtension: "xcodeproj").absoluteString.replacingOccurrences(of: "file://", with: "")
                                                        XCTEqualAfterCasting(error, toTypeOf: XcodeBuildWrapper.ErrorEnum.couldNotFindAnySchemes("Command line invocation:\n    /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild -list -project \(url)\n\nInformation about project \"NoScheme\":\n    Targets:\n        NoScheme\n\n    Build Configurations:\n        Debug\n        Release\n\n    If no build configuration is specified and -scheme is not passed then \"Release\" is used.\n\n    This project contains no schemes.\n"))
                                                        expectation.fulfill()
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