//
//  CharityPaymentTest.swift
//  TamboonTests
//
//  Created by Darshan Gajera on 13/02/21.
//

import XCTest
@testable import Pods_Tamboon
@testable import Tamboon
@testable import MFCard

class CharityPaymentTest: XCTestCase {
    var objCardView = MFCardView()
    let cardNumber = "4111111111111111"
    let cardname = "Darshan Gajera"
    let expireMonth = "03"
    let expireYear = "2021"
    let cvv = "111"
    let tokenId = "" // Enter token id that generated from the Omise API.
    let amount = 20
    let serialQueue = DispatchQueue(label: "denny.queue")
    var objCharityPaymentViewModel = CharityPaymentViewModel()
    
    func testCardDetails() {
        let card :Card? = Card(holderName: self.cardname, number: self.cardNumber, month: Month(rawValue: self.expireMonth)!, year: self.expireYear, cvc: self.cvv, paymentType: Card.PaymentType.card, cardType: CardType.Unknown, userId: 1)
        let results = objCardView.validationCard(card: card)
        XCTAssertTrue(results.0, results.1)
    }
    
    func testGenerateTokenAPI() {
        let completedExpectation: XCTestExpectation = expectation(description: "Generate token from card details")
        let dicParam = ["card[name]": cardname,
                        "card[number]": cardNumber,
                        "card[security_code]": cvv,
                        "card[expiration_month]": expireMonth,
                        "card[expiration_year]": expireYear] as [String : Any]
        self.objCharityPaymentViewModel.apiGenerateTokenCode(dicParam: dicParam) { (isSuccess) in
            completedExpectation.fulfill()
            XCTAssertTrue(isSuccess!)
        }
        self.wait(for: [completedExpectation], timeout: 10)
    }
    
    func testCreateChargeAPI() {
        let completedExpectation: XCTestExpectation = expectation(description: "Create Charge and get success from api")
        // First enter the value of parameters on the global variables of this class.
        let dicParam = ["name": cardname,
                        "amount":Int(Float(amount) * 1000),
                        "token":tokenId] as [String : Any]
        self.objCharityPaymentViewModel.apiCreateCharge(dicParam: dicParam, completion: { (isSuccess) in
            completedExpectation.fulfill()
            XCTAssertTrue(isSuccess!)
        })
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
