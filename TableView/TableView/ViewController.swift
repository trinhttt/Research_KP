//
//  ViewController.swift
//  TableView
//
//  Created by Trinh Thai on 9/30/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

struct HCObject {
    let height: Int
    let color: UIColor
}

class ViewController: UIViewController {

    let colorArr: [UIColor] = [.blue, .brown, .yellow, .red, .gray, .green]
    
    let hcArr: [HCObject] = [
        HCObject(height: 40, color: .blue),
        HCObject(height: 50, color: .brown),
        HCObject(height: 60, color: .yellow),
        HCObject(height: 70, color: .red),
        HCObject(height: 80, color: .gray),
        HCObject(height: 90, color: .green),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell") as! DemoTableViewCell
        cell.textLabel?.text = "Trinh"
//        cell.backgroundColor = colorArr.randomElement()
        cell.backgroundColor = hcArr[indexPath.row].color
        print(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(hcArr[indexPath.row].height)
    }
    
}



