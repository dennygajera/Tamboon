//
//  Encodable+Dictionary.swift
//
//  Created by Darshan Gajera on 2/12/21.
//

import UIKit

extension Encodable {
    subscript(key: String) -> Any? {
        return dictionary[key]
    }
    var dictionary: [String: Any] {
        return (try? JSONSerialization.jsonObject(with: JSONEncoder().encode(self))) as? [String: Any] ?? [:]
    }
}

