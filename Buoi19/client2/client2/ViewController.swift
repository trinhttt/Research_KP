//
//  ViewController.swift
//  client2
//
//  Created by Quân on 11/10/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLogin(_ sender: Any) {
        login(url: "http://localhost:3000/login")
    }
    
    func login(url: String){
        let url:URL = URL(string: url)!
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "POST"
        let param: [String: Any] = [
            "username" : tfUsername.text!,
            "password": tfPassword.text!
        ]
        req.httpBody = param.percentEscaped().data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: req) { (data, urlResponse, err) in
//            print(String(data: data!, encoding: .utf8))
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

