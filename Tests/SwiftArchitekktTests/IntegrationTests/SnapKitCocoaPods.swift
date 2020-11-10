//  Copyright © 2020 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTest {

    func testSnapKitCocoaPodsForWorkspace() {
        testNodeRequestHandlingForRessourceFile(withName: "SnapKitCocoaPods",
                                                 pathExtension: "xcworkspace",
                                                 options: ["scheme": "SnapKitCocoaPods"],
                                                 lastProcedure: SwiftNodeRequestHandler.LastProcedure.generatingNode,
                                                 completionValidationHandler: { (result, expectation) in
                                                    print(result)
                                                 }
        )
    }
}
