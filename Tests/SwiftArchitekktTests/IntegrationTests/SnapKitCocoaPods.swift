//  Copyright © 2020 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

extension IntegrationTest {

    func testSnapKitCocoaPodsForWorkspace() {
        testNodeRequestHandlingForRessourceFile(withName: "SnapKitCocoaPods",
                                                 pathExtension: "xcworkspace",
                                                 options: ["scheme": "SnapKitCocoaPods"],
                                                 lastProcedure: SwiftNodeRequestHandler.LastProcedure.finished,
                                                 completionValidationHandler: { (result, expectation) in
                                                    if case let NodeRequest.Result.success(_, node, _, warnings) = result {
                                                        XCTAssertEqual(node.children.count, 2)
                                                        let snapKitNode = node.children[0]
                                                        XCTAssertEqual(snapKitNode.name, "SnapKit")
                                                        XCTAssertEqual(snapKitNode.children.count, 0)
                                                        let SnapKitCocoaPodsNode = node.children[1]
                                                        XCTAssertEqual(SnapKitCocoaPodsNode.name, "SnapKitCocoaPods")
                                                        XCTAssertEqual(SnapKitCocoaPodsNode.children.count, 3)
                                                        XCTAssertEqual(warnings.count, 1)
                                                        XCTStringMatchesPattern(string: warnings[0], pattern: "AST for SnapKit has invalid format@@@")
                                                        expectation.fulfill()
                                                    } else {
                                                        XCTFail()
                                                    }
                                                 }
        )
    }
}
