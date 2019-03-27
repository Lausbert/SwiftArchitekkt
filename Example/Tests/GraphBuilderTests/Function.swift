//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension GraphBuilderTests {

    func testGraphBuilderForEmptyFunction() {
        // function Test() {}
        let ast = """
(source_file "Test.swift"
  (func_decl range=[Test.swift:1:1 - line:1:14] "Test()" interface type='() -> ()' access=internal
    (parameter_list range=[Test.swift:1:10 - line:1:11])
    (brace_stmt range=[Test.swift:1:13 - line:1:14])))
"""
        let expectedGraphString = """
{
  "children" : [
    {
      "children" : [
        {
          "children" : [
            {
              "isRoot" : false,
              "scope" : "parameter_list"
            },
            {
              "isRoot" : false,
              "scope" : "brace_stmt"
            }
          ],
          "identifier" : "Test()",
          "isRoot" : false,
          "scope" : "func_decl",
          "tags" : [
            "access=internal",
            "interface"
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
