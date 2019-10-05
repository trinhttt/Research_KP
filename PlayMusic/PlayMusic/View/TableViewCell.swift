//
//  TableViewCell.swift
//  PlayMusic
//
//  Created by Trinh Thai on 10/5/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var ibAvatarImage: UIImageView!
    @IBOutlet weak var ibLabel1: UILabel!
    @IBOutlet weak var ibLabel2: UILabel!
    
    // MARK: - Variables
    var musicArr: [Music] = [Music(singerName: "Le Bao Binh", songName: "Buoc qua doi nhau", image: ""), Music(singerName: "Duc Phuc", songName: "Het thuong can nho", image: ""), Music(singerName: "Jack", songName: "Song gio", image: "")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(index: Int) {
        ibLabel1.text = musicArr[index].songName
        ibLabel2.text = musicArr[index].singerName
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
