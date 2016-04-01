//
//  RegisterViewController.swift
//  ricochetAlphaNoStoryboard
//
//  Created by Aidan Fuhrer on 31.03.16.
//  Copyright © 2016 ricochet. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //#selector(LoginViewController.loginButtonClicked(_:))
        
        
        let style: UIBarButtonItemStyle = .Plain
        let testNavBarButton: UIBarButtonItem = UIBarButtonItem(title: "Done", style: style, target: self, action: #selector(RegisterViewController.printTest(_:)))

        self.navigationItem.setRightBarButtonItem(testNavBarButton, animated: true)
        view.backgroundColor = UIColor.whiteColor()
    }
    
    func printTest(sender: UINavigationController!) {
        print("test")
    
    }

    

}
