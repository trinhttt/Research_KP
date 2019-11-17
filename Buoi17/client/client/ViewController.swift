//
//  ViewController.swift
//  client
//
//  Created by Quân on 11/3/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrHocSinh:[HocSinh] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getData(url: "http://10.0.0.110:3000/hocsinh")
    }


    func getData(url:String){
        let url:URL = URL(string: url)!
        var req:URLRequest = URLRequest(url: url)
        req.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: req) { (data, urlResponse, error) in
            do {
                let json = try JSONDecoder.init().decode([HocSinh].self, from: data!)
                self.arrHocSinh = json
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
        return arrHocSinh.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HocSinhCell", for: indexPath) as! HocSinhCell
        cell.bindData(hocsinh: arrHocSinh[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
}

struct HocSinh:Codable {
    var HOTEN:String
    var NAMSINH:Int
    var GIOITINH:String
}
