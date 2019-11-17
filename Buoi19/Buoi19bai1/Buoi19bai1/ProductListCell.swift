//
//  ProductListCell.swift
//  Buoi19bai1
//
//  Created by Quân on 11/10/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ProductListCell: UITableViewCell {

    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(p: Product) {
        lblName.text = p.NAME
        lblPrice.text = String(p.PRICE)
        lblDescription.text = p.DESCRIPTION
    }

}
