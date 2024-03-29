//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTest {

    func testWrongFileExtension() {
        testNodeRequestHandlingForRessourceFile(withName: "WrongFileExtension",
                                                 pathExtension: "test",
                                                 lastProcedure: SwiftNodeRequestHandler.LastProcedure.updatingNodeRequest,
                                                 completionValidationHandler: { (result, expectation) in
                                                    switch result {
                                                    case .success, .decisionNeeded:
                                                        XCTFail()
                                                    case .failure(_, let error):
                                                        if let error = error as? XcodeBuildWrapper.ErrorEnum, case XcodeBuildWrapper.ErrorEnum.couldNotHandleFileExtension = error {
                                                            expectation.fulfill()
                                                        } else {
                                                            XCTFail()
                                                        }
                                                    }
        })
    }

}
