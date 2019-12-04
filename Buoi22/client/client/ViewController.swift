//
//  ViewController.swift
//  client
//
//  Created by Quân on 11/17/19.
//  Copyright © 2019 QuanNguyen. All rights reserved.
//

import UIKit
import Alamofire
import DKImagePickerController

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrImage:[UIImage] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func ADD(_ sender: Any) {
        Helper.shared.showPicker(self) { (images) in
            self.arrImage.append(contentsOf: images)
            self.collectionView.reloadData()
        }
    }
    
    @IBAction func Upload(_ sender: Any) {
        uploadImage()
    }
    
    func uploadImage(){
        
        // Data
        var dataImage:[Dictionary<String,Any>]? = []
        for item in arrImage {
            let tmpImg = item.jpegData(compressionQuality: 0.5)
            dataImage!.append(
                [
                    "key":"galery",
                    "value": tmpImg as Any
                ]
            )
        }
        
        RequestService.shared.upload("http://localhost:3000/array", BaseUpload.self, dataImage) { (result, json, error) in
            if let model = json as? BaseUpload {
                print(model.message)
            }
        }
    }
    
    @IBAction func Login(_ sender: Any) {
        let params = [
            "username":"vugiaduc123",
            "password":"toilatoi123"
        ] as [String:Any]

        RequestService.shared.requestWith("http://localhost:3000/login", .post, params, JSONEncoding.default, nil, BaseResponse.self) { (result, data, error) in
            if result {
                guard let model = data as? BaseResponse else {
                    return
                }
                let alert = UIAlertController(title: "Thong Bao", message: model.message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageItemCell", for: indexPath) as! ImageItemCell
        cell.imgv.image = arrImage[indexPath.item]
        return cell
    }
    
}

