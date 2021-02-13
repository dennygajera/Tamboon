//
//  CharityTest.swift
//  TamboonTests
//
//  Created by Darshan Gajera on 13/02/21.
//

import XCTest
@testable import Tamboon
class CharityTest: XCTestCase {
    var objCharitiesViewModel = CharitiesViewModel()
    
    override func setUp() {
        
    }
    
    func testCharitesAPI() {
        let completedExpectation: XCTestExpectation = expectation(description: "Get all charities data")
        self.objCharitiesViewModel.apiGetAllCharity { (isSuccess) in
            completedExpectation.fulfill()
            XCTAssertTrue(isSuccess!)
        }
        self.wait(for: [completedExpectation], timeout: 10)
    }
    
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

}
