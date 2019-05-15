//  Copyright © 2019 Stephan Lerner. All rights reserved.

import XCTest
import CoreArchitekkt
@testable import SwiftArchitekkt

class GraphBuilderTests: XCTestCase {

    func testGraphBuilderFor(ast: String, expectedGraphString: String) {
        guard let url = URL(string: "/does/not/matter/since/only/happy/path/is/Tested") else { fatalError("Could not initialize url.") }
        let graphRequest = GraphRequest(url: url, options: [:])
        let rootNode = GraphBuilder(ast: ast).generateGraph(graphRequest: graphRequest) { (_) in
            XCTFail("Should not happend since only happy path is Tested. Happy path control flow is synchronous.")
        }
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        if let data = try? encoder.encode(rootNode), let graphString = String(data: data, encoding: String.Encoding.utf8) {
            XCTStringMatchesPattern(string: graphString, pattern: expectedGraphString)
        } else {
            XCTFail("Could not encode root node.")
        }
    }

}
