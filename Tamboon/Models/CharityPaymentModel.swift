//
//  CharityModel.swift
//  Tamboon
//
//  Created by Darshan Gajera on 12/02/21.
//

struct OmiseCardToken: Codable { // needed information
    var object: String?
    var id: String?
    var card: CreditCardDetail?
}

struct CreditCardDetail: Codable { // needed information
    var id: String?
}

