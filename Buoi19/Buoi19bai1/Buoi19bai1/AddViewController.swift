//
//  AddViewController.swift
//  Buoi19bai1
//
//  Created by Quân on 11/10/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var tfPrice: UITextField!
    
    @IBOutlet weak var tfDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func Add(_ sender: Any) {

            let url: URL = URL(string: "http://localhost:3000/add")!
            var req: URLRequest = URLRequest(url: url)
            req.httpMethod = "POST"
        let param: [String: Any] = [
            "name" : tfName.text!,
            "price": tfPrice.text!,
            "description": tfDescription.text!
            ]
            req.httpBody = param.percentEscaped().data(using: .utf8)
            
            let task = URLSession.shared.dataTask(with: req) { (data, urlResponse, err) in
                do {
                    let json = try JSONDecoder.init().decode(result.self, from: data!)
                    if(json.res > 0){
                        print("Add Successful")
                    }
                   
                }catch let err {
                    print(err.localizedDescription)
                }
            }
            task.resume()
        }
    }
    
extension Dictionary {
    func percentEscaped() -> String {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
    }
}

extension CharacterSet {
    static let urlQueryValueAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@" // does not include "?" or "/" due to RFC 3986 - Section 3.4
        let subDelimitersToEncode = "!$&'()*+,;="

        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}
