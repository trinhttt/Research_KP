//
//  ViewController.swift
//  Navigation
//
//  Created by Trinh Thai on 9/28/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // trong suốt(transparent) navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        // navigationController?.navigationBar.isTranslucent = true
        
        print("do viewDidLoad")
    }
    
    override func loadView() {
        super.loadView()
        print("do loadview")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("do viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("do viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("do viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("do viewDidDisappear")
        
    }
    
    @IBAction func ibLoginTapped(_ sender: Any) {
        
        //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //        let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        //        navigationController?.pushViewController(vc, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabbar = storyboard.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window?.rootViewController = tabbar
        
    }
    
    @IBAction func ibRegisterTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

