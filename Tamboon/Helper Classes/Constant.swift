//
//  Constant.swift
//
//  Created by Darshan Gajera on 2/12/21.

import UIKit
struct GlobalConstants {
    static let APPNAME = "Tamboon"
    static let Error = "Error"
}

struct OmiseKeys {
    static let publicKey = "pkey_test_5mu64n1hy9762d7f1go"
}

enum Storyboard: String {
    case main    = "Main"
    func storyboard() -> UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
}

enum Color: String {
    case AppColorCode  = "358AA9"
    func color() -> UIColor {
        return UIColor.hexStringToUIColor(hex: self.rawValue)
    }
}

enum Identifier: String {
    // Main Storyboard
    case charities = "CharitiesVC"
    case CharityPayment = "CharityPaymentVC"
    case TransactionResult = "TransactionResultVC"
    
    // Tableview Cell
    case charityCell = "CharityCell"
}

struct ErrorMesssages {
    static let emptyAmount = "Please enter some amount!"
    static let lessAmount = "Donation amount must be more than ฿20"
    static let wentWrong = "Something went wrong, please try after sometimes!"
}

struct SuccessMessages {
    
}
