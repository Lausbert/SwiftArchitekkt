//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension GraphBuilderTests {

    func testGraphBuilderForEmptyEnum() {
        // enum Test {}
        let ast = """
(source_file "Test.swift"
  (enum_decl range=[Test.swift:1:1 - line:1:12] "Test" interface type='Test.Type' access=internal non-resilient))
"""
        let expectedGraphString = """
{
  "children" : [
    {
      "identifier" : "Test.Type",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "arcs" : [
            {
              "identifier" : "Test.Type",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "Test",
          "isRoot" : false,
          "scope" : "enum_decl",
          "tags" : [
            "access=internal",
            "interface",
            "non-resilient"
          ]
        }
      ],
      "identifier" : "TestSourceFile",
      "isRoot" : false,
      "scope" : "source_file"
    }
  ],
  "identifier" : "testModule",
  "isRoot" : false,
  "scope" : "module"
}
"""
        testGraphBuilderFor(ast: ast, expectedGraphString: expectedGraphString)
    }

}
