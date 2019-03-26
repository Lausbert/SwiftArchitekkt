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
    
    func testGraphBuilderForClassInheritance() {
        // class BaseClass {}
        // class Test: BaseClass {}
        let ast = """
(source_file "Test.swift"
  (class_decl range=[Test.swift:1:1 - line:1:18] "BaseClass" interface type='BaseClass.Type' access=internal non-resilient
    (constructor_decl implicit range=[Test.swift:1:7 - line:1:7] "init()" interface type='(BaseClass.Type) -> () -> BaseClass' access=internal designated
      (parameter "self" interface type='BaseClass')
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))
    (destructor_decl implicit range=[Test.swift:1:7 - line:1:7] "deinit" interface type='(BaseClass) -> () -> ()' access=internal @objc
      (parameter "self" interface type='BaseClass')
      (parameter_list)
      (brace_stmt implicit range=[Test.swift:1:7 - line:1:7])))
  (class_decl range=[Test.swift:2:1 - line:2:24] "Test" interface type='Test.Type' access=internal non-resilient inherits: BaseClass
    (constructor_decl implicit range=[Test.swift:2:23 - line:2:23] "init()" interface type='(Test.Type) -> () -> Test' access=internal override=Test.(file).BaseClass.init()@Test.swift:1:7 designated
      (parameter "self" interface type='Test')
      (parameter_list)
      (brace_stmt implicit
        (rebind_self_in_constructor_expr implicit type='()'
          (call_expr implicit type='BaseClass' nothrow arg_labels=
            (dot_syntax_call_expr implicit type='() -> BaseClass' super nothrow
              (other_constructor_ref_expr implicit type='(BaseClass) -> () -> BaseClass' decl=Test.(file).BaseClass.init()@Test.swift:1:7)
              (super_ref_expr implicit type='BaseClass'))
            (tuple_expr implicit type='()')))
        (return_stmt implicit)))
    (destructor_decl implicit range=[Test.swift:2:7 - line:2:7] "deinit" interface type='(Test) -> () -> ()' access=internal @objc
      (parameter "self" interface type='Test')
      (parameter_list)
      (brace_stmt implicit range=[Test.swift:2:7 - line:2:7]))))
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
              "identifier" : "BaseClass.Type",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "BaseClass",
          "isRoot" : false,
          "scope" : "class"
        },
        {
          "arcs" : [
            {
              "identifier" : "BaseClass",
              "isRoot" : false,
              "scope" : "class"
            }
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
    
    func testGraphBuilderForClassProtocolConformance() {
        // protocol Protocol {}
        // class Test: Protocol {}
        let ast = """
(source_file "Test.swift"
  (protocol range=[Test.swift:1:1 - line:1:20] "Protocol" <Self : Protocol> interface type='Protocol.Protocol' access=internal non-resilient requirement signature=<Self>)
  (class_decl range=[Test.swift:2:1 - line:2:23] "Test" interface type='Test.Type' access=internal non-resilient inherits: Protocol
    (constructor_decl implicit range=[Test.swift:2:7 - line:2:7] "init()" interface type='(Test.Type) -> () -> Test' access=internal designated
      (parameter "self" interface type='Test')
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))
    (destructor_decl implicit range=[Test.swift:2:7 - line:2:7] "deinit" interface type='(Test) -> () -> ()' access=internal @objc
      (parameter "self" interface type='Test')
      (parameter_list)
      (brace_stmt implicit range=[Test.swift:2:7 - line:2:7]))))
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
              "identifier" : "Protocol.Protocol",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "Protocol",
          "isRoot" : false,
          "scope" : "protocol"
        },
        {
          "arcs" : [
            {
              "identifier" : "Protocol",
              "isRoot" : false,
              "scope" : "protocol"
            }
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
    
    func testGraphBuilderForClassInheritanceAndProtocolConformance() {
        // protocol Protocol {}
        // class BaseClass {}
        // class Test: BaseClass, Protocol {}
        let ast = """
(source_file "Test.swift"
  (protocol range=[Test.swift:1:1 - line:1:20] "Protocol" <Self : Protocol> interface type='Protocol.Protocol' access=internal non-resilient requirement signature=<Self>)
  (class_decl range=[Test.swift:2:1 - line:2:18] "BaseClass" interface type='BaseClass.Type' access=internal non-resilient
    (constructor_decl implicit range=[Test.swift:2:7 - line:2:7] "init()" interface type='(BaseClass.Type) -> () -> BaseClass' access=internal designated
      (parameter "self" interface type='BaseClass')
      (parameter_list)
      (brace_stmt implicit
        (return_stmt implicit)))
    (destructor_decl implicit range=[Test.swift:2:7 - line:2:7] "deinit" interface type='(BaseClass) -> () -> ()' access=internal @objc
      (parameter "self" interface type='BaseClass')
      (parameter_list)
      (brace_stmt implicit range=[Test.swift:2:7 - line:2:7])))
  (class_decl range=[Test.swift:3:1 - line:3:34] "Test" interface type='Test.Type' access=internal non-resilient inherits: BaseClass, Protocol
    (constructor_decl implicit range=[Test.swift:3:33 - line:3:33] "init()" interface type='(Test.Type) -> () -> Test' access=internal override=Test.(file).BaseClass.init()@Test.swift:2:7 designated
      (parameter "self" interface type='Test')
      (parameter_list)
      (brace_stmt implicit
        (rebind_self_in_constructor_expr implicit type='()'
          (call_expr implicit type='BaseClass' nothrow arg_labels=
            (dot_syntax_call_expr implicit type='() -> BaseClass' super nothrow
              (other_constructor_ref_expr implicit type='(BaseClass) -> () -> BaseClass' decl=Test.(file).BaseClass.init()@Test.swift:2:7)
              (super_ref_expr implicit type='BaseClass'))
            (tuple_expr implicit type='()')))
        (return_stmt implicit)))
    (destructor_decl implicit range=[Test.swift:3:7 - line:3:7] "deinit" interface type='(Test) -> () -> ()' access=internal @objc
      (parameter "self" interface type='Test')
      (parameter_list)
      (brace_stmt implicit range=[Test.swift:3:7 - line:3:7]))))
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
              "identifier" : "Protocol.Protocol",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "Protocol",
          "isRoot" : false,
          "scope" : "protocol"
        },
        {
          "arcs" : [

          ],
          "children" : [
            {
              "identifier" : "BaseClass.Type",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "BaseClass",
          "isRoot" : false,
          "scope" : "class"
        },
        {
          "arcs" : [
            {
              "identifier" : "BaseClass",
              "isRoot" : false,
              "scope" : "class"
            },
            {
              "identifier" : "Protocol",
              "isRoot" : false,
              "scope" : "protocol"
            }
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
