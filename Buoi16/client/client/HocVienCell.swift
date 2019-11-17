//
//  HocVienCell.swift
//  client
//
//  Created by Quân on 11/2/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class HocVienCell: UITableViewCell {

    @IBOutlet weak var lbHoTen: UILabel!
    @IBOutlet weak var lbNamSinh: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bindData(hocvien: HocVien){
        lbHoTen.text = hocvien.HOTEN
        lbNamSinh.text = "\(hocvien.NAMSINH)"
    }
}
