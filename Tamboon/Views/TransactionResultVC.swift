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
        self.title = "Success"
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func btnExploreCharityClick(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
