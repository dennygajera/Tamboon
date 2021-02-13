//
//  CharityPaymentTest.swift
//  TamboonTests
//
//  Created by Darshan Gajera on 13/02/21.
//

import XCTest
@testable import Pods_Tamboon
@testable import MFCard
class CharityPaymentTest: XCTestCase {
    var objCardView = MFCardView()
    let cardNumber = "43211111111111111"
    let cardname = "Darshan Gajera"
    let expireMonth = "02"
    let expireYear = "2021"
    let cvv = "111"
    
    func testCardDetails() {
        let card :Card? = Card(holderName: self.cardname, number: self.cardNumber, month: Month(rawValue: self.expireMonth)!, year: self.expireYear, cvc: self.cvv, paymentType: Card.PaymentType.card, cardType: CardType.Unknown, userId: 1)
        let results = objCardView.validationCard(card: card)
        XCTAssertTrue(results.0, results.1)
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
