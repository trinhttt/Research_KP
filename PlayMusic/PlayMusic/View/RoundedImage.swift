//
//  RoundedImage.swift
//  PlayMusic
//
//  Created by Trinh Thai on 10/5/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import Foundation
import UIKit

class RoundedImage: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.bounds.width / 2
        self.clipsToBounds = true
    }
}
