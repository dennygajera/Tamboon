//
//  CharitiesVC.swift
//  Tamboon
//
//  Created by Darshan Gajera on 12/02/21.
//

import UIKit
import SDWebImage
class CharitiesVC: UIViewController {
    @IBOutlet weak var tblView: UITableView!
    
    var objCharitiesViewModel = CharitiesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Charities"
        self.apiCall()
        self.tblView.tableFooterView = UIView() // To remove seperators when loading
    }
    
    func apiCall() {
        objCharitiesViewModel.apiGetAllCharity { (isSuccess) in
            if isSuccess! {
                self.tblView.delegate = self
                self.tblView.dataSource = self
                self.tblView.reloadData()
            }
        }
    }
}
    
extension CharitiesVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.objCharitiesViewModel.charities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let singleCharity = self.objCharitiesViewModel.charities![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.charityCell.rawValue, for: indexPath) as! CharityCell
        cell.lblCharityName.text = singleCharity.name
        cell.imgViewCharity.sd_setImage(with: URL(string: singleCharity.logo_url ?? ""), placeholderImage: UIImage(named: "icoCharityPlaceholder"), options: .refreshCached, completed: { (img, err, cacahe, url) in
        })
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let singleSelectedCharity = self.objCharitiesViewModel.charities![indexPath.row]
        let charityPayment = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.CharityPayment.rawValue) as! CharityPaymentVC
        charityPayment.selectedCharity = singleSelectedCharity
        self.navigationController?.pushViewController(charityPayment, animated: true)
    }
}
