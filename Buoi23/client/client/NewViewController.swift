//
//  NewViewController.swift
//  client
//
//  Created by Quân on 11/30/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var imgv: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func MoveImage(_ sender: UIPanGestureRecognizer) {
        let point = sender.translation(in: view)
        sender.view?.transform = (sender.view?.transform.translatedBy(x: point.x, y: point.y))!
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let point = touches.first?.location(in: view)
//        print(point)
    }

}
