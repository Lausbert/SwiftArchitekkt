//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension GraphBuilderTests {

    func testGraphBuilderForEmptyProtocol() {
        // protocol Test {}
        let ast = """
(source_file "Test.swift"
  (protocol range=[Test.swift:1:1 - line:1:16] "Test" <Self : Test> interface type='Test.Protocol' access=internal non-resilient requirement signature=<Self>))
"""
        let expectedGraphString = """
{
  "children" : [
    {
      "identifier" : "Test.Protocol",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "children" : [
        {
          "arcs" : [
            {
              "identifier" : "Test.Protocol",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "Test",
          "isRoot" : false,
          "scope" : "protocol",
          "tags" : [
            "Self : Test",
            "access=internal",
            "interface",
            "non-resilient",
            "requirement",
            "signature=<Self>"
          ]
        }
      ],
      "identifier" : "TestSourceFile",
      "isRoot" : false,
      "scope" : "source_file"
    }
  ],
  "isRoot" : true,
  "scope" : "root"
}
"""
        testGraphBuilderFor(ast: ast, expectedGraphString: expectedGraphString)
    }

}
