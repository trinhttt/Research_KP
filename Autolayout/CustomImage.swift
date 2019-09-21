//
//  CustomImage.swift
//  Autolayout
//
//  Created by Trinh Thai on 9/21/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CustomImage: UIImageView {
    override func layoutSubviews() {
        self.layer.cornerRadius = self.frame.height/2
    }
}
