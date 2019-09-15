//
//  ViewController.swift
//  Slider
//
//  Created by Trinh Thai on 9/14/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ibLabel2: UILabel!
    @IBOutlet weak var ibImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func ibChinhLonNho(_ sender: UISlider) {
        ibLabel2.text = String(sender.value)
        ibImage.transform = CGAffineTransform(scaleX: CGFloat(sender.value), y: CGFloat(sender.value))
        
    }
    
    @IBAction func ibSwitchOnOff(_ sender: UISwitch) {
        if sender.isOn {
            ibImage.image = UIImage(named: "lamp")
        }else {
             ibImage.image = UIImage(named: "lamp-2")
        }
    }
}

