//
//  ViewController.swift
//  SaleLayout
//
//  Created by Trinh Thai on 10/12/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange(_:)), name: notification, object: nil)
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        print(notif.userInfo)
        self.performSegue(withIdentifier: "fromHomeToDetailProduct", sender: nil)
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as? BannerCell {
                return cell

            }
//            cell?.textLabel?.text = "Banner"
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell {
                return cell
            }
//            cell?.textLabel?.text = "CategoryCell"

        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell {
                return cell
            }
//            cell?.textLabel?.text = "ProductCell"

        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 217
        case 1:
            return 100
        case 2:
            return 300
        default:
            return UITableView.automaticDimension
        }
        
//        return UITableView.automaticDimension

    }
    
}
