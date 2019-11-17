//
//  ViewController.swift
//  Buoi19bai1
//
//  Created by Quân on 11/10/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var arrProduct: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Read(url: "http://10.0.0.108:3000/read")
    }
    override func viewWillAppear(_ animated: Bool) {
        Read(url: "http://10.0.0.108:3000/read")
    }
    func Read(url: String) {
        let url: URL = URL(string: url)!
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: req) { (data, urlResponse, err) in
            do {
                let json = try JSONDecoder.init().decode([Product].self, from: data!)
                
                self.arrProduct = json
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch let err {
                print(err.localizedDescription)
            }
        }
        task.resume()
    }
    
    func Delete(id: String) {
         let url: URL = URL(string: "http://localhost:3000/delete")!
                   var req: URLRequest = URLRequest(url: url)
                   req.httpMethod = "POST"
               let param: [String: Any] = [
                   "id" : id,
                   ]
                   req.httpBody = param.percentEscaped().data(using: .utf8)
                   
                   let task = URLSession.shared.dataTask(with: req) { (data, urlResponse, err) in
                       do {
                           let json = try JSONDecoder.init().decode(result.self, from: data!)
                           if(json.res > 0){
                               print("Delete Successful")
                        
                            self.Read(url: "http://localhost:3000/read")

                           }
                          
                       }catch let err {
                           print(err.localizedDescription)
                       }
                   }
                   task.resume()
               }
    }


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let delete = UIContextualAction(style: .normal, title: "DELETE") { (_, _, nil) in
            self.Delete(id: self.arrProduct[indexPath.row].ID)
        }
        
        let menu = UISwipeActionsConfiguration(actions: [delete])
        return menu
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListCell") as! ProductListCell
        cell.bindData(p: arrProduct[indexPath.row])
        return cell
    }
    
    
}

