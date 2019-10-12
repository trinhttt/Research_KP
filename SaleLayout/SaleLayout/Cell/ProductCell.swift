//
//  ProductCell.swift
//  SaleLayout
//
//  Created by Trinh Thai on 10/12/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var ibCollectionView: UICollectionView!
    
    let arr1 = ["A", "B", "C", "D"]
    let arr2 = ["1", "2", "3", "4"]
    override func awakeFromNib() {
        super.awakeFromNib()
        ibCollectionView.delegate = self
        ibCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension ProductCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductItemCell", for: indexPath) as? ProductItemCell {
            cell.ibLabel1.text = arr1[indexPath.row]
            cell.ibLabel2.text = arr2[indexPath.row]
            return cell

        }
        return UICollectionViewCell()
    }
    
    
}
