// Copyright © 2020 Stephan Lerner. All rights reserved.

import UIKit
import CocoaPod

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let testClass = TestClass()
    let testStruct = TestStruct()
    let testEnum = TestEnum.test
    let testGenericClass = TestGenericClass<String>()

}

class TestChildClass: TestClass, TestProtocol {}

class TestGenericChildClass: TestGenericClass<Int>, TestProtocol {}

