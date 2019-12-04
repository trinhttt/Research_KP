//
//  Content.swift
//  client
//
//  Created by Quân on 11/30/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class Content: UILabel {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let edgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        super.drawText(in: rect.inset(by: edgeInsets))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.width += 20
        return contentSize
    }

}
