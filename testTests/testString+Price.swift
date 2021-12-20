//
//  testString+Price.swift
//  testTests
//
//  Created by Max on 2021/12/20.
//  Copyright © 2021 Max. All rights reserved.
//

import XCTest
@testable import test
class testString_Price: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMoneyOfficialSpell() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
//        // 正确转换
//        let str = "123.01234"
//        let convert = str.moneyOfficialSpell()
//        XCTAssert(convert == "123.01")
//        
//        let str2 = "0123"
//        let convert2 = str2.moneyOfficialSpell()
//        XCTAssert(convert2 == "123.00")
//        
//        // 去掉前面的0
//        let str3 = "01234"
//        let convert3 = str3.moneyOfficialSpell()
//        XCTAssert(convert3 == "1,234.00")
//        
//        // 前面不加逗号
//        let str4 = "234"
//        let convert4 = str4.moneyOfficialSpell()
//        XCTAssert(convert4 == "234.00")
        
        // 小数点开头
        let str5 = ".234"
        let convert5 = str5.moneyOfficialSpell()
        XCTAssert(convert5 == "0.23")
                  
//        XCTFail(".01")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
