//
//  ViewController.swift
//  Animation
//
//  Created by Trinh Thai on 9/15/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ibImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //ZoomInOut()
        //testSomeAnimationFuc()
        
        Rotate180()
        //Rotate360()
    }
    
    // MARK: - Xoay 180
    func Rotate180() {

        //c1
        UIView.animate(withDuration: 2) {
            self.ibImage.transform = CGAffineTransform(rotationAngle: .pi/2)
        }
        
        return
        
            //c2
            UIView.animate(withDuration: 2) {
                self.ibImage.transform = CGAffineTransform(scaleX: -1, y: -1)
        }
    }
    
    // MARK: - Xoay 360
    func Rotate360() {
        //C1
        let rotate = CABasicAnimation(keyPath: "transform.rotation.z")
        rotate.fromValue = 0
        rotate.toValue = CFloat.pi
        ibImage.layer.add(rotate, forKey: nil)
        
        return
        //c2:
        UIView.animate(withDuration: 2) {
            self.ibImage.transform = CGAffineTransform(rotationAngle: .pi)
        }
    }
    
    //MARK: - Bo goc + phong to/thu nho = animation
    func ZoomInOut() {
        ibImage.layer.borderWidth = 3
        ibImage.layer.borderColor = #colorLiteral(red: 0.2729129493, green: 0.7007476687, blue: 0.9834728837, alpha: 1)
        UIView.animate(withDuration: 1,
                       animations: {
                        self.ibImage.layer.cornerRadius = self.ibImage.frame.width/2
        }) { (finish) in
                UIView.animate(withDuration: 1, delay: 0, options: .repeat, animations: {
                self.ibImage.transform = CGAffineTransform(scaleX: 2, y: 2)
            }, completion: nil)
        }
    }
    

    func testSomeAnimationFuc(){
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
        
    }

}

