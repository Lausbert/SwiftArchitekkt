//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

class GraphBuilderTests: XCTestCase {

    func testGraphBuilderFor(ast: String, expectedGraphString: String) {
        guard let moduleNode = try? ModuleGraphBuilder(ast: ("testModule", ast)).generateGraph() else {
            XCTFail("Could not generate module node.")
            return
        }
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        if let data = try? encoder.encode(moduleNode), let graphString = String(data: data, encoding: String.Encoding.utf8) {
            XCTStringMatchesPattern(string: graphString, pattern: expectedGraphString)
        } else {
            XCTFail("Could not encode root node.")
        }
    }

}
