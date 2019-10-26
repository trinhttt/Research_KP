//
//  Category.swift
//  SaleLayout
//
//  Created by Trinh Thai on 10/26/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import Foundation

struct Category: Codable {
    var id: Int
    var name: String
}

struct Product: Codable {
    var name: String
    var price: String
    var category: Int
}
