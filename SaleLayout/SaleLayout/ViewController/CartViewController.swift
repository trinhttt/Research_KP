//
//  CartViewController.swift
//  SaleLayout
//
//  Created by Trinh Thai on 10/19/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 3 {
//            return 3
//        }else {
//            return 1
//        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "NumberProductCell", for: indexPath) as? ProductNameCell {
                return cell
                
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CartUserInfoCell", for: indexPath) as? ProductNameCell {
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "NotiListProductCell", for: indexPath) as? ProductInfoCell {
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ListProductCell", for: indexPath) as? ProductInfoCell {
                return cell
            }
        default:
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentCell", for: indexPath) as? ProductInfoCell {
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            
        default:
            return UITableView.automaticDimension
        }
    }
    
}

