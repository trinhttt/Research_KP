//
//  ChatCell.swift
//  client
//
//  Created by Quân on 11/30/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var lbContent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lbContent.layer.masksToBounds = true
        lbContent.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
