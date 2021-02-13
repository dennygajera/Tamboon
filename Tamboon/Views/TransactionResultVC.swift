//
//  TransactionResultVC.swift
//  Tamboon
//
//  Created by Darshan Gajera on 13/02/21.
//

import UIKit

class TransactionResultVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnExploreCharityClick(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
