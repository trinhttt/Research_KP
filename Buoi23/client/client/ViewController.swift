//
//  ViewController.swift
//  client
//
//  Created by Quân on 11/24/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit
import SocketIO

let manager = SocketManager(socketURL: URL(string: "http://10.0.0.106:3000")!, config: [.log(true), .compress])
let socket = manager.defaultSocket

class ViewController: UIViewController {

    @IBOutlet weak var tfContent: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    var arrContent:[Contents] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableHeight()
        
        socket.on("tui-gui") { (data, ack) in
            guard let content = data[0] as? String else {return}
            self.arrContent.append(Contents(content: content, type: "tui-gui"))
            self.setupTableHeight()
            self.tableView.reloadData()
            
//            print(data[0] as? String ?? "")
//            print("tui gui")
        }
        socket.on("nguoi-ta-gui") { (data, ack) in
            guard let content = data[0] as? String else {return}
            self.arrContent.append(Contents(content: content, type: "nguoi-ta-gui"))
            self.setupTableHeight()
            self.tableView.reloadData()
//            print(data[0] as? String ?? "")
//            print("nguoi ta gui")
        }
        socket.connect()
    }

    @IBAction func Send(_ sender: Any) {
        socket.emit("client-send", "\(tfContent.text!)")
        
    }
    
    func setupTableHeight(){
        if CGFloat(arrContent.count * 50) > 700 {
            self.tableViewHeight.constant = 700
        } else {
            self.tableViewHeight.constant = CGFloat(arrContent.count * 50)
        }
        let numberOfRows = self.tableView.numberOfRows(inSection: 0)
        if numberOfRows != 0 {
            let indexPath = IndexPath(row: numberOfRows-1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        switch arrContent[indexPath.row].type {
        case "tui-gui":
            cell.lbContent.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor).isActive = true
        default:
            cell.lbContent.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor).isActive = true
        }
        cell.lbContent.text = arrContent[indexPath.row].content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}

struct Contents {
    let content:String
    let type:String
}
