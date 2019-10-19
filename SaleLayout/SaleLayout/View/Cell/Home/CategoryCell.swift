//
//  CategoryCell.swift
//  SaleLayout
//
//  Created by Trinh Thai on 10/12/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var ibCollectionView: UICollectionView!
    
    let arr = ["Loai A", "Loai B", "Loai C"]
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
extension CategoryCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryItemCell", for: indexPath) as? CategoryItemCell {
            cell.ibLabel.text = arr[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    
}
