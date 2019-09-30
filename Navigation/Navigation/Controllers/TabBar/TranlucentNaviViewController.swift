//
//  TranlucentNaviViewController.swift
//  Navigation
//
//  Created by Trinh Thai on 9/30/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class TranlucentNaviViewController: TranlucentNaviViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

}
