//
//  MainViewController.swift
//  ricochetAlphaNoStoryboard
//
//  Created by Aidan Fuhrer on 02.04.16.
//  Copyright © 2016 ricochet. All rights reserved.
//

import UIKit

var loggedIn = false


class MainViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.navigationController?.navigationBarHidden = true
        

        
        
        view.backgroundColor = UIColor.greenColor()
        
        let arrayVC = navigationController?.viewControllers
        print(arrayVC)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        self.tabBarController?.tabBar.hidden = false
        
        let vcArray = self.navigationController?.viewControllers
        print(vcArray)
        
        if !loggedIn {
            
            let loginController = LoginViewController()
//            navigationController?.pushViewController(loginController, animated: true)
            self.navigationController?.pushViewController(loginController, animated: true)
        }
    }

}
