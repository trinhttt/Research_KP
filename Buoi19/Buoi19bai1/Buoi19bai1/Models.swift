//
//  Models.swift
//  Buoi19bai1
//
//  Created by Quân on 11/10/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import Foundation
import UIKit

struct Product: Codable {
     var DESCRIPTION : String
     var ID : String
     var NAME : String
     var PRICE : Int
}

struct result: Codable {
    var res: Int
}
