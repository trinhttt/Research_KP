//
//  Helper.swift
//  client
//
//  Created by Quân on 11/23/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import Foundation
import DKImagePickerController

struct Helper {
    
    static let shared = Helper()
    
    func showPicker(_ vc: UIViewController, _ complete:@escaping (_ images: [UIImage])->Void){
        let picker = DKImagePickerController()
        picker.didSelectAssets = { (assets: [DKAsset]) in
//            print(assets)
            var images = [UIImage]()
            for item in assets {
                item.fetchImage(with: CGSize(width: 300, height: 300)) { (img, info) in
                    images.append(img!)
                    print(images.count)
                }
            }
            complete(images)
        }
        vc.present(picker, animated: true, completion: nil)
    }
    
}
