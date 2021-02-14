//
//  CharityPaymentVC.swift
//  Tamboon
//
//  Created by Darshan Gajera on 12/02/21.
//

import UIKit
import MFCard

class CharityPaymentVC: UIViewController {
    // Outlets
    @IBOutlet weak var txtAmount: UITextField! {
        didSet { txtAmount?.addDoneCancelToolbar() }
    }
    @IBOutlet var cardView: MFCardView!
    
    // Global Variables
    var viewModel = CharityPaymentViewModel()
    var selectedCharity: Charity?
    
    // MARK: View's Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedCharity?.name ?? "Charity"
        cardView.delegate = self
        cardView.toast = true
        self.txtAmount.setPadding(left: 10, right: 10)
    }
    
    // MARK: ALL Functionalities
    func generateCardToken(_ card: Card!) {
        if self.txtAmount.text!.removeSpecialChars().count <= 0 || self.txtAmount!.text!.removeSpecialChars() == "0" {
            self.presentAlertWithTitle(presentStyle: .alert, title: GlobalConstants.Error, message: ErrorMesssages.emptyAmount, options: "Ok") { (index) in
            }
        } else if Float(self.txtAmount.text!.removeSpecialChars())! < 20 {
            self.presentAlertWithTitle(presentStyle: .alert, title: GlobalConstants.Error, message: ErrorMesssages.lessAmount, options: "Ok") { (index) in
            }
        } else {
            let dicParam = ["card[name]":card.name!,
                            "card[number]":card.number!,
                            "card[security_code]":card.cvc!,
                            "card[expiration_month]":card.month!.rawValue,
                            "card[expiration_year]":card.year!,
            ] as [String : Any]
            self.viewModel.apiGenerateTokenCode(dicParam: dicParam) { (isSuccess) in
                if isSuccess! {
                    // use token id to generate charge
                    self.generateCharge(self.viewModel.objOmiseCardToken?.id, card.name!)
                }
            }
        }
    }
    
    func generateCharge(_ tokenId: String!,_ doner_name: String) {
        let dicParam = ["name": doner_name,
                        "amount":Int(Float(self.txtAmount.text!.removeSpecialChars())! * 1000),
                        "token":tokenId!] as [String : Any]
        
        self.viewModel.apiCreateCharge(dicParam: dicParam) { (isSuccess) in
            if isSuccess! {
                let result = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.TransactionResult.rawValue) as! TransactionResultVC
                self.navigationController?.pushViewController(result, animated: true)
            } else {
                self.presentAlertWithTitle(presentStyle: .alert, title: GlobalConstants.Error, message: ErrorMesssages.wentWrong, options: "Ok") { (index) in }
            }
        }
    }
    
    @IBAction func txtAmountTextChange(_ sender: Any) {
        if (self.txtAmount.text?.removeSpecialChars().count)! > 0 {
            self.txtAmount.text = "฿ \(self.txtAmount.text?.removeSpecialChars() ?? "")"
        } else {
            self.txtAmount.text = ""
        }
        
    }
    
}

// MARK: Card Form Delegates
extension CharityPaymentVC: MFCardDelegate {
    func cardTypeDidIdentify(_ cardType: String) {
        
    }
    
    func cardDidClose() {
        
    }
    
    func cardDoneButtonClicked(_ card: Card?, error: String?) {
        if error == nil {
            self.generateCardToken(card)
        }
    }
}
