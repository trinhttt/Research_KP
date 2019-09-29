//
//  RegisterViewController.swift
//  Navigation
//
//  Created by Trinh Thai on 9/28/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("xanh viewDidLoad")
        navigationItem.hidesBackButton = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("xanh viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("xanh viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("xanh viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("xanh viewDidDisappear")
        
    }
    
    @IBAction func ibRegisterTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func ibBackTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
