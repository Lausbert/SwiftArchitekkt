//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

class IntegrationTest: XCTestCase {

    func testGraphRequestHandlingForRessourceFile(withName name: String,
                                                  pathExtension: String,
                                                  options: [GraphRequest.Parameter: GraphRequest.Option] = [:],
                                                  timeout: Double = 60,
                                                  lastProcedure: SwiftGraphRequestHandler.LastProcedure,
                                                  statusUpdateValidationHandler: ((GraphRequest, GraphRequest.AdditionalInformation?, XCTestExpectation) -> Void)? = nil,
                                                  completionValidationHandler: ((GraphRequest.Result, XCTestExpectation) -> Void)? = nil) {
        let url = getUrlForRessourceFile(withName: name, pathExtension: pathExtension)
        let options = options.merging([String(describing: SwiftGraphRequestHandler.LastProcedure.self): lastProcedure.rawValue], uniquingKeysWith: { first, _ in first })
        let expectation = XCTestExpectation(description: "expectation fullfilled")
        let swiftGraphRequestHandler = SwiftGraphRequestHandler()
        guard let firstAccessRequirement = swiftGraphRequestHandler.consistentUrlRequirements?[0] else { fatalError("No access requirement defined for swift graph request handler.") }
        guard let firstAccessibleUrl = URL(string: "/Applications/Xcode.app/") else { fatalError("Could not initialize accessible url.") }
        let graphRequest = GraphRequest(url: url, options: options, consistentlyRequiredUrls: [firstAccessRequirement: firstAccessibleUrl])
        swiftGraphRequestHandler.handle(graphRequest: graphRequest, statusUpdateHandler: { (statusUpdate) in
            switch statusUpdate {
            case .willStartProcedure(_, let procedure):
                XCTAssert(self.isProcedureAllowed(currentProcedure: procedure, lastProcedure: lastProcedure))
            case .didFinishProcedure(let graphRequest, let procedure, let additionalInformation):
                XCTAssert(self.isProcedureAllowed(currentProcedure: procedure, lastProcedure: lastProcedure))
                guard procedure == lastProcedure.rawValue else { return }
                statusUpdateValidationHandler?(graphRequest, additionalInformation, expectation)
            }
        }) { (result) in
            if let completionValidationHandler = completionValidationHandler {
                completionValidationHandler(result, expectation)
            } else {
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: timeout)
    }

    func isProcedureAllowed(currentProcedure: String, lastProcedure: SwiftGraphRequestHandler.LastProcedure) -> Bool {
        let orderedProcedures = SwiftGraphRequestHandler.LastProcedure.allCases.map { $0.rawValue }
        guard let indexOfCurrentProcedure = orderedProcedures.firstIndex(of: currentProcedure) else { return false }
        guard let indexOfLastProcedure = orderedProcedures.firstIndex(of: lastProcedure.rawValue) else { return false }
        return indexOfCurrentProcedure <= indexOfLastProcedure
    }

}
