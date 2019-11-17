//
//  ViewController.swift
//  client
//
//  Created by Quân on 11/16/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        print(UserDefaults.standard.object(forKey: "token") as? String ?? "")
        check_token(url: "http://localhost:3000/check_token")
        
    }

    func check_token(url: String){
        let url:URL = URL(string: url)!
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "POST"
        let param: [String: Any] = [
            "token": UserDefaults.standard.object(forKey: "token") as! String
        ]
        req.httpBody = param.percentEscaped().data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: req) { (data, urlResponse, err) in
//            print(String(data: data!, encoding: .utf8))
            do {
                let json = try JSONDecoder.init().decode(User.self, from: data!)
                print(json.name)
            }catch let err {
                print(err.localizedDescription)
            }
        }
        task.resume()
    }
    
    @IBAction func Login(_ sender: Any) {
        let url:URL = URL(string: "http://localhost:3000/createToken")!
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: req) { (data, urlResponse, err) in
//            print(String(data: data!, encoding: .utf8))
            do {
                let json = try JSONDecoder.init().decode(Token.self, from: data!)
                print(json.token)
                // luu token
                UserDefaults.standard.set(json.token, forKey: "token")
            }catch let err {
                print(err.localizedDescription)
            }
        }
        task.resume()
    }

}

struct Token:Codable {
    var token:String
}

struct User:Codable {
    var name: String
    var age: Int
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
