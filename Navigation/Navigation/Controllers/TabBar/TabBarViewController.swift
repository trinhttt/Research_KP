//
//  TabBarViewController.swift
//  Navigation
//
//  Created by Trinh Thai on 9/28/19.
//  Copyright © 2019 Trinh Thai. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupTabBar()
    }

    func setupTabBar() {
//        let home = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController//
//        let favorite = mainStoryboard.instantiateViewController(withIdentifier: "FaroriteViewController") as! FaroriteViewController
//        self.viewControllers = [home, favorite]
        
        let home = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        home.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        let navHome = UINavigationController(rootViewController: home)

        let favorite = mainStoryboard.instantiateViewController(withIdentifier: "FaroriteViewController") as! FaroriteViewController
        favorite.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        let navFavorite = UINavigationController(rootViewController: favorite)
        
        let history = mainStoryboard.instantiateViewController(withIdentifier: "HistoryViewController") as! HistoryViewController
        history.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        let navHistory = UINavigationController(rootViewController: history)
        
        let search = mainStoryboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        search.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        let navSearch = UINavigationController(rootViewController: search)
        self.viewControllers = [navHome, navFavorite, navSearch, navHistory]
        
    }
}
