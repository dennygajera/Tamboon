//
//  CharityCell.swift
//  Tamboon
//
//  Created by Darshan Gajera on 12/02/21.
//

import UIKit

class CharityCell: UITableViewCell {
    
    @IBOutlet weak var lblCharityName: UILabel!
    @IBOutlet weak var imgViewCharity: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
