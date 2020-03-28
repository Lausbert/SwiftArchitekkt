// Copyright © 2020 Stephan Lerner. All rights reserved.

import UIKit
import Package

class ViewController: UIViewController {
    
    let testClass = TestClass()
    let testStruct = TestStruct()
    let testEnum = TestEnum.test
    let testGenericClass = TestGenericClass<String>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

class TestChildClass: TestClass, TestProtocol {}

class TestGenericChildClass: TestGenericClass<Int>, TestProtocol {}
