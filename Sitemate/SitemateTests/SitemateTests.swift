//
//  SitemateTests.swift
//  SitemateTests
//
//  Created by Ramiz Rafiq on 10/07/2022.
//

import XCTest
@testable import Sitemate

class SitemateTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testCommonStringFetchMethodSuccess() throws
    {
        let value = Common.getStringValueForKey(key: "Api_Failed_Error")
        XCTAssertEqual(value, "It's not you, it's us. Our engineers are working on it.")
    }
    func testCommonStringFetchMethodFail() throws
    {
        let value = Common.getStringValueForKey(key: "Api_Failed_Error")
        XCTAssertNotEqual(value, "nishta")
    }

    func testMapperToEntitySuccess()
    {
        let jsonDictionary: [String: Any] = ["lyrics": "Turn your magic on, Umi she'd say"]
        let lyricsMapped =  Lyrics(JSON: jsonDictionary)
        
        XCTAssertEqual(lyricsMapped?.lyrics, "Turn your magic on, Umi she'd say")
    }
    func testMapperToEntityFail()
    {
        let jsonDictionary: [String: Any] = ["lyrics": "Turn your magic on, Umi she'd say"]
        let lyricsMapped =  Lyrics(JSON: jsonDictionary)
        
        XCTAssertNotEqual(lyricsMapped?.lyrics, "Ramiz11")
    }

}
