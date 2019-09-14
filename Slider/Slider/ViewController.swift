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
        
        let img = UIImageView(frame: CGRect(x: CGFloat(100), y: CGFloat(100), width: 100, height: 100))
        let random = Int.random(in: 1...2)
        
        img.image = UIImage(named: String(random))
        img.contentMode = .scaleAspectFit
        view.addSubview(img)
//        UIView.animate(withDuration: 3) {
//            img.frame.origin.y = 700
//            img.frame.origin.x = 300
//        }
        
//        UIView.animate(withDuration: 3, animations: {
//            img.frame.origin.y = 700
//        }) { (_) in
//            img.frame.origin.x = 300
//        }

        //OPTIONS:
        //.repeat: Lap di lap lai
        //.curveEaseIn: Nhanh dan
        //.curveEaseOut: Cham dan
        //.curveEaseInOut: Cham -> Nhanh o giua -> Cham
        //[.repeat, .autoreverse]: Tu dong tra lai & lap lai
        
        //DELAY: Khoang time lan dau delay
//        UIView.animate(withDuration: 3,
//                       delay: 2,
//                       options: .autoreverse,
//                       animations: {
//                        img.frame.origin.y = 700
//        },
//                       completion: nil)
        
        //Damping: Doc shock
        //Velocity: Toc do cua animation
        UIView.animate(withDuration: 3,
                       delay: 1,
                       usingSpringWithDamping: 10,
                       initialSpringVelocity: 10,
                       options: .repeat,
                       animations: {
                        img.frame.origin.y = 700
        },
                       completion: nil)
        
        //Bo goc + phong to/thu nho = animation
        //Toa ra + thu lai trong map
        //Xoay 360
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

