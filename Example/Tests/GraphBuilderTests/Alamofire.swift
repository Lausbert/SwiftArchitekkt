//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension GraphBuilderTests {

    func testGraphBuilderForAlamofireiOS() {
        // class Test {}
        let ast = """

"""
        let expectedGraphString = """

"""
        testGraphBuilderFor(ast: ast, expectedGraphString: expectedGraphString)
    }

}
