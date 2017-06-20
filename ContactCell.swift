//
//  ContactCell.swift
//  ContactDemo
//
//  Created by gumivn002 on 6/20/17.
//  Copyright © 2017 gumivn002. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
