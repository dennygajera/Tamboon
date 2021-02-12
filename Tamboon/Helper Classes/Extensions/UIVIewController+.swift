//
//  UIVIewController+.swift
//
//  Created by Darshan Gajera on 12/02/21.
//

import Foundation
import UIKit

typealias okButton = (_ left : UIButton) -> Void
typealias cancelButton = (_ right : UIButton) -> Void

extension UIViewController {
    func presentAlertWithTitle(presentStyle: UIAlertController.Style ,title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: presentStyle)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
}

