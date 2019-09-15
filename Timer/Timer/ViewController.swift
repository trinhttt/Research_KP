//
//  ViewController.swift
//  Timer
//
//  Created by Trinh Thai on 9/15/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var x:CGFloat = 0
    var y:CGFloat = 0
    var w:CGFloat = 100
    var h:CGFloat = 100
    var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        //timerFire()
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(rotatePicture), userInfo: nil, repeats: true)
    }
    
    @objc func rotatePicture() {
        let img = UIImageView(frame: CGRect(x: x, y: y, width: w, height: h))
        img.image = UIImage(named: "vit")
        view.addSubview(img)
        img.transform = img.transform.rotated(by: .pi/180)
    }
    
    func timerFire() {
        //timer la nhung buoc nhay, neu k can dung phia sau k can gan bien timer
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer1) in
            self.createPic()
            //Dat ten thi use dc
            //timer1.fire() : chay
            //timer1..invalidate() : dung lai
        })
    }
    
    func createPic() {
        //coi cach 2
        
        let img = UIImageView(frame: CGRect(x: x, y: y, width: w, height: h))
        img.image = UIImage(named: "vit")
        view.addSubview(img)
        x += w
        if x + w > view.frame.width {
            self.timer?.invalidate()
            x = 0
            y += h
            timerFire()
            if y + h > view.frame.height {
                self.timer?.invalidate()
            }
        }
    }

}

