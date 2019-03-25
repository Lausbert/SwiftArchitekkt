//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

extension GraphBuilderTests {
    
    func testGraphBuilderForEmptyClass() {
        // class Test {}
        let ast = """
(source_file "Test.swift"
  (class_decl range=[Test.swift:1:1 - line:1:13] "Test" interface type='Test.Type' access=internal non-resilient
    (constructor_decl implicit range=[Test.swift:1:7 - line:1:7] "init()" interface type='(Test.Type) -> () -> Test' access=internal designated
      (parameter "self" interface type='Test')
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))
    (destructor_decl implicit range=[Test.swift:1:7 - line:1:7] "deinit" interface type='(Test) -> () -> ()' access=internal @objc
      (parameter "self" interface type='Test')
      (parameter_list)
      (brace_stmt implicit range=[Test.swift:1:7 - line:1:7]))))
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
          "scope" : "class"
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
