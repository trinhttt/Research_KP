//
//  DetailProductViewController.swift
//  SaleLayout
//
//  Created by Trinh Thai on 10/19/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class DetailProductViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}

extension DetailProductViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductBannerCell", for: indexPath) as? BannerCell {
                return cell
                
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductNameCell", for: indexPath) as? ProductNameCell {
                return cell
            }
            
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInfoCell", for: indexPath) as? ProductInfoCell {
                return cell
            }
        default:
            
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AddToCartCell", for: indexPath) as? AddToCartCell {
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

