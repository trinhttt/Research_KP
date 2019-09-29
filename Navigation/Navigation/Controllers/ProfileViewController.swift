//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Trinh Thai on 9/28/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("vang viewDidLoad")

        // Do any additional setup after loading the view.
    }
    override func loadView() {
        print("vang loadview")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("vang viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("vang viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("vang viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("vang viewDidDisappear")
        
    }
    
    @IBAction func ibPopToRootVC(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
   
    @IBAction func ibPopToVC(_ sender: Any) {
        
        ///SAI
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        
        ///ĐÚNG
        
        ///C1:
//        let vc = navigationController?.viewControllers[1] as! RegisterViewController
//        navigationController?.popToViewController(vc, animated: true)
        
        ///C2:
        for vc in  self.navigationController!.viewControllers {
            if vc is RegisterViewController {
                self.navigationController?.popToViewController(vc, animated: false)
            }
        }
    }
    
    @IBAction func ibPopVC(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
