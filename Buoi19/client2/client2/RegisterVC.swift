//
//  RegisterVC.swift
//  client2
//
//  Created by Quân on 11/10/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfFullname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        tfUsername.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegister(_ sender: Any) {
        register(url: "http://localhost:3000/add")
    }
    
    func register(url: String){
        let url:URL = URL(string: url)!
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "POST"
        let param: [String: Any] = [
            "username" : tfUsername.text!,
            "password": tfPassword.text!,
            "fullname": tfFullname.text!,
            "phonenumber": tfPhoneNumber.text!
        ]
        req.httpBody = param.percentEscaped().data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: req) { (data, urlResponse, err) in
            print(String(data: data!, encoding: .utf8))
            do {
                let json = try JSONDecoder.init().decode(response.self, from: data!)
                print(json.message)
            }catch let err {
                print(err.localizedDescription)
            }
        }
        task.resume()
    }
}

struct response: Codable {
    var result: Bool
    var message: String
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
extension RegisterVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
//        checkExistUser(username: tfFullname.text!)
        register(url: "http://localhost:3000/add")
    }
//    func checkExistUser(username: String) {
//        let url:URL = URL(string: "http://localhost:3000/readuser")!
//               var req: URLRequest = URLRequest(url: url)
//               req.httpMethod = "POST"
//               let param: [String: Any] = [
//                "username" : username,
//
//               ]
//               req.httpBody = param.percentEscaped().data(using: .utf8)
//
//               let task = URLSession.shared.dataTask(with: req) { (data, urlResponse, err) in
//                   print(String(data: data!, encoding: .utf8))
//                   do {
//                       let json = try JSONDecoder.init().decode(response.self, from: data!)
//                       if(json.res > 0){
//                           print("Duplicate")
//                       }
//
//                   }catch let err {
//                       print(err.localizedDescription)
//                   }
//               }
//               task.resume()
//           }
//    }

}

