//
//  LaunchScreenViewController.swift
//  BauCuaGame
//
//  Created by Trinh Thai on 9/22/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var ibLogoImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        UIView.animate(withDuration: 3, animations: {
            self.ibLogoImg.alpha = 0
            self.view.backgroundColor = .white
        }, completion: { (finish) in
            self.performSegue(withIdentifier: "segueFromLaunchVCTOMainVC", sender: nil)
        })
    }

}
