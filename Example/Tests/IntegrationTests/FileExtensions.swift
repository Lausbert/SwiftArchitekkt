//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTests {

    func testWrongFileExtension() {
        testGraphRequestHandlingForRessourceFile(withName: "WrongFileExtension",
                                                 pathExtension: "test",
                                                 lastProcedure: SwiftGraphRequestHandler.LastProcedure.updatingGraphRequest,
                                                 completionValidationHandler: { (result, expectation) in
                                                    switch result {
                                                    case .success, .decisionNeeded:
                                                        XCTFail()
                                                    case .failure(_, let error):
                                                        XCTEqualAfterCasting(error, toTypeOf: XcodeBuildWrapper.ErrorEnum.couldNotHandleFileExtension("test"))
                                                        expectation.fulfill()
                                                    }
        })
    }

}
