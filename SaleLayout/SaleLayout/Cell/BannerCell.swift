//
//  BannerCell.swift
//  SaleLayout
//
//  Created by Trinh Thai on 10/12/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class BannerCell: UITableViewCell {

    @IBOutlet weak var ibCollectionView: UICollectionView!
    @IBOutlet weak var ibPageControl: UIPageControl!
    
    var imageArr: [String] = ["img01", "img02", "img03", "img01", "img02", "img03"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupLayout() {
        ibPageControl.currentPage = 0
        ibPageControl.numberOfPages = imageArr.count
    }

}

extension BannerCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerItemCell", for: indexPath) as? BannerItemCell {
            cell.ibImage.image = UIImage(named: imageArr[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        ibPageControl.currentPage = indexPath.item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
}
