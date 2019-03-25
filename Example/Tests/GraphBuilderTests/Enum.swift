//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension GraphBuilderTests {
    
    func testGraphBuilderForEmptyEnum() {
        // enum Test {}
        let ast = """
(enum_decl range=[Test.swift:1:1 - line:1:12] "Test" interface type='Test.Type' access=internal non-resilient))
"""
        let expectedGraphString = """
{
  "children" : [
    {
      "arcs" : [

      ],
      "children" : [
        {
          "identifier" : "Test.Type",
          "isRoot" : false,
          "scope" : "unknown"
        }
      ],
      "identifier" : "Test",
      "isRoot" : false,
      "scope" : "enum"
    }
  ],
  "isRoot" : true,
  "scope" : "root"
}
"""
        testGraphBuilderFor(ast: ast, expectedGraphString: expectedGraphString)
    }
    
}
