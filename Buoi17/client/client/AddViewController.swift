//
//  AddViewController.swift
//  client
//
//  Created by Quân on 11/3/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var tfHoTen: UITextField!
    @IBOutlet weak var tfNamSinh: UITextField!
    @IBOutlet weak var tfGioiTinh: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ADD(_ sender: Any) {
        self.postData(url: "http://10.0.0.110:3000/hocsinh")
    }
    
    func postData(url:String){
        let url:URL = URL(string: url)!
        var req:URLRequest = URLRequest(url: url)
        req.httpMethod = "POST"
        // body
        // parameters = {String: Any}
        let parameters: [String: Any] = [
            "HOTEN":tfHoTen.text!,
            "NAMSINH":Int(tfNamSinh.text!)!,
            "GIOITINH":tfGioiTinh.text!
        ]
//        // chuoi - hoten, namsinh, gioitinh
//        let chuoi:String = String(format: "HOTEN=%@&NAMSINH=%@&GIOITINH=%@", tfHoTen.text!,tfNamSinh.text!,tfGioiTinh.text!)
//        print(chuoi)
//        let str:String = "HOTEN=\(tfHoTen.text!)&NAMSINH=\(tfNamSinh.text!)&GIOITINH=\(tfGioiTinh.text!)"
//        print(str)
//        // Data
//        let dt:Data = str.data(using: String.Encoding.utf8)!
        
        // data
        let dt:Data = parameters.percentEscaped().data(using: .utf8)!
        req.httpBody = dt
        let task = URLSession.shared.dataTask(with: req) { (data, urlResponse, error) in
            
            do {
                let json = try JSONDecoder.init().decode(KetQua.self, from: data!)
                if json.kq == "1" {
                    DispatchQueue.main.async {
                        let alert = UIAlertController(title: "Thong Bao", message: "Them thanh cong", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (success) in
                            self.navigationController?.popViewController(animated: true)
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            } catch {
                print("json error")
            }
        }
        task.resume()
    }
    
}

struct KetQua:Codable {
    var kq:String
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
