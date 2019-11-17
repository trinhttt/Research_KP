//
//  HocSinhCell.swift
//  client
//
//  Created by Quân on 11/3/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class HocSinhCell: UITableViewCell {

    @IBOutlet weak var lbHoTen: UILabel!
    @IBOutlet weak var lbNamSinh: UILabel!
    @IBOutlet weak var lbGioiTinh: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bindData(hocsinh:HocSinh){
        lbHoTen.text = hocsinh.HOTEN
        lbNamSinh.text = "\(hocsinh.NAMSINH)"
        lbGioiTinh.text = hocsinh.GIOITINH
    }
}
