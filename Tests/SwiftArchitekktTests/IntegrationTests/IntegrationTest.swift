//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

class IntegrationTest: XCTestCase {

    func testNodeRequestHandlingForRessourceFile(withName name: String,
                                                  pathExtension: String,
                                                  options: [NodeRequest.Parameter: NodeRequest.Option] = [:],
                                                  timeout: Double = 60,
                                                  lastProcedure: SwiftNodeRequestHandler.LastProcedure,
                                                  statusUpdateValidationHandler: ((NodeRequest, NodeRequest.AdditionalInformation?, XCTestExpectation) -> Void)? = nil,
                                                  completionValidationHandler: ((NodeRequest.Result, XCTestExpectation) -> Void)? = nil) {
        let url = getUrlForRessourceFile(withName: name, pathExtension: pathExtension)
        let options = options.merging([String(describing: SwiftNodeRequestHandler.LastProcedure.self): lastProcedure.rawValue], uniquingKeysWith: { first, _ in first })
        let expectation = XCTestExpectation(description: "expectation fullfilled")
        let swiftNodeRequestHandler = SwiftNodeRequestHandler()
        guard let firstAccessRequirement = swiftNodeRequestHandler.consistentUrlRequirements?[0] else { fatalError("No access requirement defined for swift node request handler.") }
        guard let firstAccessibleUrl = URL(string: "/Applications/Xcode-beta.app/") else { fatalError("Could not initialize accessible url.") }
        let nodeRequest = NodeRequest(url: url, options: options, consistentlyRequiredUrls: [firstAccessRequirement: firstAccessibleUrl])
        swiftNodeRequestHandler.handle(nodeRequest: nodeRequest, statusUpdateHandler: { (statusUpdate) in
            switch statusUpdate {
            case .willStartProcedure(_, let procedure):
                XCTAssert(self.isProcedureAllowed(currentProcedure: procedure, lastProcedure: lastProcedure))
            case .didFinishProcedure(let nodeRequest, let procedure, let additionalInformation):
                XCTAssert(self.isProcedureAllowed(currentProcedure: procedure, lastProcedure: lastProcedure))
                guard procedure == lastProcedure.rawValue else { return }
                statusUpdateValidationHandler?(nodeRequest, additionalInformation, expectation)
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

    func isProcedureAllowed(currentProcedure: String, lastProcedure: SwiftNodeRequestHandler.LastProcedure) -> Bool {
        let orderedProcedures = SwiftNodeRequestHandler.LastProcedure.allCases.map { $0.rawValue }
        guard let indexOfCurrentProcedure = orderedProcedures.firstIndex(of: currentProcedure) else { return false }
        guard let indexOfLastProcedure = orderedProcedures.firstIndex(of: lastProcedure.rawValue) else { return false }
        return indexOfCurrentProcedure <= indexOfLastProcedure
    }

}
