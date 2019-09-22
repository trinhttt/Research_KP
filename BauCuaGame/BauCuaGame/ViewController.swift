//
//  ViewController.swift
//  BauCuaGame
//
//  Created by Trinh Thai on 9/15/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    @IBOutlet var ibResultImages: [UIImageView]!

    var arr: [UIImage?] = [UIImage(named: "bau"), UIImage(named: "ca"), UIImage(named: "cua"), UIImage(named: "ga"), UIImage(named: "nai"), UIImage(named: "tom")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        if event?.subtype == .motionShake {
            // Put in code here to handle shake
            ring()
    
            let rotate = CABasicAnimation(keyPath: "transform.rotation.z")
            rotate.fromValue = 0
            rotate.toValue = CFloat.pi * 2
            rotate.duration = 0.5
            rotate.repeatCount = 3
            self.ibResultImages[0].layer.add(rotate, forKey: nil)
            self.ibResultImages[1].layer.add(rotate, forKey: nil)
            self.ibResultImages[2].layer.add(rotate, forKey: nil)
            UIView.animate(withDuration: 1, delay: 1, options: .curveEaseIn, animations: {
                self.ibResultImages[0].image = self.arr.randomElement() ?? UIImage()
                self.ibResultImages[1].image = self.arr.randomElement() ?? UIImage()
                self.ibResultImages[2].image = self.arr.randomElement() ?? UIImage()
            }, completion: nil)
        
        }
        if super.responds(to: #selector(UIResponder.motionEnded(_:with:))) {
            super.motionEnded(motion, with: event)
        }
    }

    func ring() {
        let path: String = Bundle.main.path(forResource: "door", ofType: "wav") ?? ""
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print("\(error)")
        }
    }

}

