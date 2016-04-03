//
//  MainViewController.swift
//  ricochetAlphaNoStoryboard
//
//  Created by Aidan Fuhrer on 02.04.16.
//  Copyright © 2016 ricochet. All rights reserved.
//

import UIKit

var loggedIn = true

class MainViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true
        
        let tabBar = UITabBar()
        tabBar.barTintColor = UIColor.blueColor()
        
        view.addSubview(tabBar)
        view.addConstraintsWithFormat("H:|[v0]|", options: nil, views: tabBar)
        view.addConstraintsWithFormat("V:[v0(50)]|", options: nil, views: tabBar)
        
        
        view.backgroundColor = UIColor.greenColor()
        
        let arrayVC = navigationController?.viewControllers
        print(arrayVC)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        if !loggedIn {
            
            let loginController = LoginViewController()
            navigationController?.pushViewController(loginController, animated: true)
        
        }
    }

}
