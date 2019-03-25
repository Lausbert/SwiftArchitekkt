//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension GraphBuilderTests {
    
    func testGraphBuilderForEmptyStruct() {
        // struct Test {}
        let ast = """
(source_file "Test.swift"
  (struct_decl range=[Test.swift:1:1 - line:1:14] "Test" interface type='Test.Type' access=internal non-resilient
    (constructor_decl implicit range=[Test.swift:1:8 - line:1:8] "init()" interface type='(Test.Type) -> () -> Test' access=internal designated
      (parameter "self" interface type='Test' inout)
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))))
"""
        let expectedGraphString = """
{
  "children" : [
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
          "scope" : "struct"
        }
      ],
      "identifier" : "TestSourceFile",
      "isRoot" : false,
      "scope" : "sourceFile"
    }
  ],
  "isRoot" : true,
  "scope" : "root"
}
"""
        testGraphBuilderFor(ast: ast, expectedGraphString: expectedGraphString)
    }
    
}
