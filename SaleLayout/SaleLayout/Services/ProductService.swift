//
//  ProductService.swift
//  SaleLayout
//
//  Created by Trinh Thai on 10/26/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import Foundation

class ProductService {
    static let instance = ProductService()
    var productList = [Product]()
    
    func getProductList(completion: @escaping (_ success: Bool)->()) {
        let url: URL = Bundle.main.url(forResource: "Product", withExtension: ".json")!
        do {
            let data: Data = try Data(contentsOf: url)
            let json = try JSONDecoder().decode([Product].self, from: data)
            for item in json {
                self.productList.append(item)
            }
        } catch {
            print(error)
        }
        completion(true)
    }
}
