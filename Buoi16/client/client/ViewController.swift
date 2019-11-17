//
//  ViewController.swift
//  client
//
//  Created by Quân on 11/2/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrHocVien:[HocVien] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.getData(url: "http://10.0.0.104:3000/hocvien")
    }
    
    func getData(url: String){
        // url
        let url:URL = URL(string: url)!
        var req:URLRequest = URLRequest(url: url)
        req.httpMethod = "GET"
        // data
        let task = URLSession.shared.dataTask(with: req) { (data, urlResponse, error) in
            let dt = String(data: data!, encoding: .utf8)
            print(dt)
            // json
            do {
                let json = try JSONDecoder.init().decode([HocVien].self, from: data!)
                print(json)
                self.arrHocVien = json
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print("json error")
            }
        }
        task.resume()
        
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrHocVien.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HocVienCell", for: indexPath) as! HocVienCell
        cell.bindData(hocvien: arrHocVien[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

public struct HocVien : Codable {

        public var HOTEN : String
        public var NAMSINH : Int
        
}
