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

    func testGraphBuilderProtocolWithAssiciatedTypeAndTwoClassesImplementingIt() {
//        protocol TestProtocol {
//            associatedtype T
//        }
//        class FirstTestClass: TestProtocol {
//            typealias T = Int
//        }
//        class SecondTestClass: TestProtocol {
//            typealias T = String
//        }
        let ast = """
(source_file "test.swift"
  (protocol range=[test.swift:1:1 - line:5:1] "TestProtocol" <Self : TestProtocol> interface type='TestProtocol.Protocol' access=internal non-resilient requirement signature=<Self>
    (associated_type_decl range=[test.swift:3:5 - line:3:20] "T" interface type='Self.T.Type' access=internal overridden=))
  (class_decl range=[test.swift:7:1 - line:11:1] "FirstTestClass" interface type='FirstTestClass.Type' access=internal non-resilient inherits: TestProtocol
    (typealias range=[test.swift:9:5 - line:9:19] "T" interface type='FirstTestClass.T.Type' access=internal type='Int')
    (constructor_decl implicit range=[test.swift:7:7 - line:7:7] "init()" interface type='(FirstTestClass.Type) -> () -> FirstTestClass' access=internal designated
      (parameter "self" interface type='FirstTestClass')
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))
    (destructor_decl implicit range=[test.swift:7:7 - line:7:7] "deinit" interface type='(FirstTestClass) -> () -> ()' access=internal @objc
      (parameter "self" interface type='FirstTestClass')
      (parameter_list)
      (brace_stmt implicit range=[test.swift:7:7 - line:7:7])))
  (class_decl range=[test.swift:13:1 - line:17:1] "SecondTestClass" interface type='SecondTestClass.Type' access=internal non-resilient inherits: TestProtocol
    (typealias range=[test.swift:15:5 - line:15:19] "T" interface type='SecondTestClass.T.Type' access=internal type='String')
    (constructor_decl implicit range=[test.swift:13:7 - line:13:7] "init()" interface type='(SecondTestClass.Type) -> () -> SecondTestClass' access=internal designated
      (parameter "self" interface type='SecondTestClass')
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))
    (destructor_decl implicit range=[test.swift:13:7 - line:13:7] "deinit" interface type='(SecondTestClass) -> () -> ()' access=internal @objc
      (parameter "self" interface type='SecondTestClass')
      (parameter_list)
      (brace_stmt implicit range=[test.swift:13:7 - line:13:7]))))
"""
        let expectedGraphString = """

"""
        testGraphBuilderFor(ast: ast, expectedGraphString: expectedGraphString)
    }

    func testGraphBuilderProtocolWithAssiciatedTypeAndTwoExtensionsImplementingIt() {
//        protocol TestProtocol {
//            associatedtype T
//        }
//        class FirstTestClass {}
//        extension FirstTestClass: TestProtocol {
//            typealias T = Int
//        }
//        class SecondTestClass {}
//        extension SecondTestClass: TestProtocol {
//            typealias T = String
//        }
        let ast = """
(source_file "test.swift"
  (protocol range=[test.swift:1:1 - line:3:1] "TestProtocol" <Self : TestProtocol> interface type='TestProtocol.Protocol' access=internal non-resilient requirement signature=<Self>
    (associated_type_decl range=[test.swift:2:5 - line:2:20] "T" interface type='Self.T.Type' access=internal overridden=))
  (class_decl range=[test.swift:4:1 - line:4:23] "FirstTestClass" interface type='FirstTestClass.Type' access=internal non-resilient
    (constructor_decl implicit range=[test.swift:4:7 - line:4:7] "init()" interface type='(FirstTestClass.Type) -> () -> FirstTestClass' access=internal designated
      (parameter "self" interface type='FirstTestClass')
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))
    (destructor_decl implicit range=[test.swift:4:7 - line:4:7] "deinit" interface type='(FirstTestClass) -> () -> ()' access=internal @objc
      (parameter "self" interface type='FirstTestClass')
      (parameter_list)
      (brace_stmt implicit range=[test.swift:4:7 - line:4:7])))
  (extension_decl range=[test.swift:5:1 - line:7:1] FirstTestClass inherits: TestProtocol
    (typealias range=[test.swift:6:5 - line:6:19] "T" interface type='FirstTestClass.T.Type' access=internal type='Int'))
  (class_decl range=[test.swift:8:1 - line:8:24] "SecondTestClass" interface type='SecondTestClass.Type' access=internal non-resilient
    (constructor_decl implicit range=[test.swift:8:7 - line:8:7] "init()" interface type='(SecondTestClass.Type) -> () -> SecondTestClass' access=internal designated
      (parameter "self" interface type='SecondTestClass')
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))
    (destructor_decl implicit range=[test.swift:8:7 - line:8:7] "deinit" interface type='(SecondTestClass) -> () -> ()' access=internal @objc
      (parameter "self" interface type='SecondTestClass')
      (parameter_list)
      (brace_stmt implicit range=[test.swift:8:7 - line:8:7])))
  (extension_decl range=[test.swift:9:1 - line:11:1] SecondTestClass inherits: TestProtocol
    (typealias range=[test.swift:10:5 - line:10:19] "T" interface type='SecondTestClass.T.Type' access=internal type='String')))
"""
        let expectedGraphString = """

"""
        testGraphBuilderFor(ast: ast, expectedGraphString: expectedGraphString)
    }

}
