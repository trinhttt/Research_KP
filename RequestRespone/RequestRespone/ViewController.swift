//
//  ViewController.swift
//  RequestRespone
//
//  Created by Trinh Thai on 10/26/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        do {
            let url: URL = Bundle.main.url(forResource: "Demo", withExtension: ".json")!
            let data: Data = try Data(contentsOf: url)
            let str = String(data: data, encoding: String.Encoding.utf8)!
            print(str)
            do {
                let json = try JSONDecoder().decode(HocSinh.self, from: data)
                
                print(json.hoten)
            } catch {
                print(error)
            }
            
            
        } catch {
            print(error)
        }
    }
}

struct HocSinh: Codable {
    var hoten: String
    var namsinh: Int
    var thethao: [TheThao]
    var diemso: DiemSo
}

struct DiemSo: Codable {
    var toan: Int
    var ly: Int
}

struct TheThao: Codable {
    var mon: String
    var yeuthich: Int
}


