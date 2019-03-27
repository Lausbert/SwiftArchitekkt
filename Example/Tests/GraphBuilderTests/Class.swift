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
          "children" : [
            {
              "arcs" : [
                {
                  "identifier" : "Test.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "identifier" : "Test.init().self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "return_stmt"
                }
              ],
              "identifier" : "Test.init()",
              "isRoot" : false,
              "scope" : "constructor_decl",
              "tags" : [
                "access=internal",
                "designated",
                "implicit",
                "interface"
              ]
            },
            {
              "children" : [
                {
                  "identifier" : "Test.deinit.self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                }
              ],
              "identifier" : "Test.deinit",
              "isRoot" : false,
              "scope" : "destructor_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "implicit",
                "interface"
              ]
            }
          ],
          "identifier" : "Test",
          "isRoot" : false,
          "scope" : "class_decl",
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
      "identifier" : "BaseClass.Type",
      "isRoot" : false,
      "scope" : "unknown"
    },
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
              "identifier" : "BaseClass.Type",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "children" : [
            {
              "arcs" : [
                {
                  "identifier" : "BaseClass.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "identifier" : "BaseClass.init().self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "return_stmt"
                }
              ],
              "identifier" : "BaseClass.init()",
              "isRoot" : false,
              "scope" : "constructor_decl",
              "tags" : [
                "access=internal",
                "designated",
                "implicit",
                "interface"
              ]
            },
            {
              "children" : [
                {
                  "identifier" : "BaseClass.deinit.self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                }
              ],
              "identifier" : "BaseClass.deinit",
              "isRoot" : false,
              "scope" : "destructor_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "implicit",
                "interface"
              ]
            }
          ],
          "identifier" : "BaseClass",
          "isRoot" : false,
          "scope" : "class_decl",
          "tags" : [
            "access=internal",
            "interface",
            "non-resilient"
          ]
        },
        {
          "arcs" : [
            {
              "identifier" : "Test.Type",
              "isRoot" : false,
              "scope" : "unknown"
            },
            {
              "identifier" : "BaseClass",
              "isRoot" : false,
              "scope" : "class_decl"
            }
          ],
          "children" : [
            {
              "arcs" : [
                {
                  "identifier" : "Test.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "BaseClass",
                  "isRoot" : false,
                  "scope" : "class_decl"
                }
              ],
              "children" : [
                {
                  "identifier" : "Test.init().self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "BaseClass",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "BaseClass",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "children" : [
                    {
                      "children" : [
                        {
                          "children" : [
                            {
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "BaseClass",
                                      "isRoot" : false,
                                      "scope" : "class_decl"
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "super_ref_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "rebind_self_in_constructor_expr"
                            },
                            {
                              "isRoot" : false,
                              "scope" : "tuple_expr",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "call_expr",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "dot_syntax_call_expr",
                      "tags" : [
                        "implicit"
                      ]
                    },
                    {
                      "isRoot" : false,
                      "scope" : "return_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "other_constructor_ref_expr",
                  "tags" : [
                    "arg_labels=",
                    "implicit",
                    "nothrow"
                  ]
                }
              ],
              "identifier" : "Test.init()",
              "isRoot" : false,
              "scope" : "constructor_decl",
              "tags" : [
                "access=internal",
                "designated",
                "implicit",
                "interface",
                "nothrow",
                "super"
              ]
            },
            {
              "children" : [
                {
                  "identifier" : "Test.deinit.self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                }
              ],
              "identifier" : "Test.deinit",
              "isRoot" : false,
              "scope" : "destructor_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "implicit",
                "interface"
              ]
            }
          ],
          "identifier" : "Test",
          "isRoot" : false,
          "scope" : "class_decl",
          "tags" : [
            "access=internal",
            "implicit",
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
      "identifier" : "Protocol.Protocol",
      "isRoot" : false,
      "scope" : "unknown"
    },
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
              "identifier" : "Protocol.Protocol",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "Protocol",
          "isRoot" : false,
          "scope" : "protocol",
          "tags" : [
            "Self : Protocol",
            "access=internal",
            "interface",
            "non-resilient",
            "requirement",
            "signature=<Self>"
          ]
        },
        {
          "arcs" : [
            {
              "identifier" : "Test.Type",
              "isRoot" : false,
              "scope" : "unknown"
            },
            {
              "identifier" : "Protocol",
              "isRoot" : false,
              "scope" : "protocol"
            }
          ],
          "children" : [
            {
              "arcs" : [
                {
                  "identifier" : "Test.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "identifier" : "Test.init().self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "return_stmt"
                }
              ],
              "identifier" : "Test.init()",
              "isRoot" : false,
              "scope" : "constructor_decl",
              "tags" : [
                "access=internal",
                "designated",
                "implicit",
                "interface"
              ]
            },
            {
              "children" : [
                {
                  "identifier" : "Test.deinit.self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                }
              ],
              "identifier" : "Test.deinit",
              "isRoot" : false,
              "scope" : "destructor_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "implicit",
                "interface"
              ]
            }
          ],
          "identifier" : "Test",
          "isRoot" : false,
          "scope" : "class_decl",
          "tags" : [
            "access=internal",
            "implicit",
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
      "identifier" : "BaseClass.Type",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "Protocol.Protocol",
      "isRoot" : false,
      "scope" : "unknown"
    },
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
              "identifier" : "Protocol.Protocol",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "Protocol",
          "isRoot" : false,
          "scope" : "protocol",
          "tags" : [
            "Self : Protocol",
            "access=internal",
            "interface",
            "non-resilient",
            "requirement",
            "signature=<Self>"
          ]
        },
        {
          "arcs" : [
            {
              "identifier" : "BaseClass.Type",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "children" : [
            {
              "arcs" : [
                {
                  "identifier" : "BaseClass.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "children" : [
                {
                  "identifier" : "BaseClass.init().self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "return_stmt"
                }
              ],
              "identifier" : "BaseClass.init()",
              "isRoot" : false,
              "scope" : "constructor_decl",
              "tags" : [
                "access=internal",
                "designated",
                "implicit",
                "interface"
              ]
            },
            {
              "children" : [
                {
                  "identifier" : "BaseClass.deinit.self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                }
              ],
              "identifier" : "BaseClass.deinit",
              "isRoot" : false,
              "scope" : "destructor_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "implicit",
                "interface"
              ]
            }
          ],
          "identifier" : "BaseClass",
          "isRoot" : false,
          "scope" : "class_decl",
          "tags" : [
            "access=internal",
            "interface",
            "non-resilient"
          ]
        },
        {
          "arcs" : [
            {
              "identifier" : "Test.Type",
              "isRoot" : false,
              "scope" : "unknown"
            },
            {
              "identifier" : "BaseClass",
              "isRoot" : false,
              "scope" : "class_decl"
            },
            {
              "identifier" : "Protocol",
              "isRoot" : false,
              "scope" : "protocol"
            }
          ],
          "children" : [
            {
              "arcs" : [
                {
                  "identifier" : "Test.Type",
                  "isRoot" : false,
                  "scope" : "unknown"
                },
                {
                  "identifier" : "BaseClass",
                  "isRoot" : false,
                  "scope" : "class_decl"
                }
              ],
              "children" : [
                {
                  "identifier" : "Test.init().self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "BaseClass",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                },
                {
                  "arcs" : [
                    {
                      "identifier" : "BaseClass",
                      "isRoot" : false,
                      "scope" : "class_decl"
                    }
                  ],
                  "children" : [
                    {
                      "children" : [
                        {
                          "children" : [
                            {
                              "children" : [
                                {
                                  "arcs" : [
                                    {
                                      "identifier" : "BaseClass",
                                      "isRoot" : false,
                                      "scope" : "class_decl"
                                    }
                                  ],
                                  "isRoot" : false,
                                  "scope" : "super_ref_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "isRoot" : false,
                              "scope" : "rebind_self_in_constructor_expr"
                            },
                            {
                              "isRoot" : false,
                              "scope" : "tuple_expr",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "isRoot" : false,
                          "scope" : "call_expr",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "isRoot" : false,
                      "scope" : "dot_syntax_call_expr",
                      "tags" : [
                        "implicit"
                      ]
                    },
                    {
                      "isRoot" : false,
                      "scope" : "return_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "isRoot" : false,
                  "scope" : "other_constructor_ref_expr",
                  "tags" : [
                    "arg_labels=",
                    "implicit",
                    "nothrow"
                  ]
                }
              ],
              "identifier" : "Test.init()",
              "isRoot" : false,
              "scope" : "constructor_decl",
              "tags" : [
                "access=internal",
                "designated",
                "implicit",
                "interface",
                "nothrow",
                "super"
              ]
            },
            {
              "children" : [
                {
                  "identifier" : "Test.deinit.self",
                  "isRoot" : false,
                  "scope" : "parameter",
                  "tags" : [
                    "interface"
                  ]
                },
                {
                  "isRoot" : false,
                  "scope" : "parameter_list"
                },
                {
                  "isRoot" : false,
                  "scope" : "brace_stmt",
                  "tags" : [
                    "implicit"
                  ]
                }
              ],
              "identifier" : "Test.deinit",
              "isRoot" : false,
              "scope" : "destructor_decl",
              "tags" : [
                "@objc",
                "access=internal",
                "implicit",
                "interface"
              ]
            }
          ],
          "identifier" : "Test",
          "isRoot" : false,
          "scope" : "class_decl",
          "tags" : [
            "access=internal",
            "implicit",
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
  "isRoot" : true,
  "scope" : "root"
}
"""
        testGraphBuilderFor(ast: ast, expectedGraphString: expectedGraphString)
    }
    
}
