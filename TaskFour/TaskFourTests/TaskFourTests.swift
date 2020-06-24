//
//  TaskFourTests.swift
//  TaskFourTests
//
//  Created by Artem Golovanev on 6/17/20.
//  Copyright © 2020 Artem Golovanev. All rights reserved.
//

import XCTest
@testable import TaskFour

class TaskFourTests: XCTestCase {

   let content = LoginContent()
    
    func testMaxLenghtError() {
        content.setContent("qwertyuiopasdfghjklzxcvbnm1234567")
        XCTAssert(content.isValid == false)
    }
    
    func testMaxLenghtSuccess() {
        content.setContent("zxcvbnmasdfghjklqwertyuiop123456")
        XCTAssert(content.isValid == true)
    }
    
    func testMinLengthError() {
        content.setContent("q")
        XCTAssert(content.isValid == false)
    }
    
    func testMinLengthSuccess() {
        content.setContent("qwe")
        XCTAssert(content.isValid == true)
    }
    
    func testFirstCharDotError() {
        content.setContent(".qwe")
        XCTAssert(content.isValid == false)
    }
    
    func testFirstCharMinusError() {
        content.setContent("-qwe")
        XCTAssert(content.isValid == false)
    }
    
    func testFirstCharNubmerError() {
        content.setContent("1qwe")
        XCTAssert(content.isValid == false)
    }
    
    func testEmtpyContentError() {
        content.setContent("")
        XCTAssert(content.isValid == false)
    }
}

