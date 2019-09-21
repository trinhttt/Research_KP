//
//  ViewController.swift
//  Autolayout
//
//  Created by Trinh Thai on 9/21/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ibAvatarImageWidth: NSLayoutConstraint!
    @IBOutlet weak var ibAvatarImage: CustomImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
//            ibAvatarImageWidth.frame.size.width = 200
            ibAvatarImageWidth.constant = 200
        } else {
//            ibAvatarImage.frame.size.width = 150
            ibAvatarImageWidth.constant = 150
        }
    }


}

