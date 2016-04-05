//
//  CustomTabBarController.swift
//  ricochetAlphaNoStoryboard
//
//  Created by Aidan Fuhrer on 02.04.16.
//  Copyright © 2016 ricochet. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let cameraControllerTest = CameraViewController()
    let cameraViewController = CameraViewController()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.delegate = self
        
        let mainController = MainViewController()
        let mainNavigationController = UINavigationController(rootViewController: mainController)
        mainNavigationController.title = "Home"
        mainNavigationController.tabBarItem.image = UIImage(named: "icon_home")
        
        
//         cameraNavigationController = UINavigationController(rootViewController: cameraControllerTest)
//        let cameraController = CameraViewController();
//        let cameraNavigationController = UINavigationController(rootViewController: cameraController)

//        cameraNavigationController.title = "Camera"
//        cameraNavigationController.tabBarItem.image = UIImage(named: "icon_camera")
        
        
        let searchController = SearchViewController()
        let searchNavigationController = UINavigationController(rootViewController: searchController)
        searchNavigationController.title = "Search"
        searchNavigationController.tabBarItem.image = UIImage(named: "icon_search")
        
        let profileController = UIViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileController)
        profileNavigationController.title = "Profile"
        profileNavigationController.tabBarItem.image = UIImage(named: "icon_gear")
        
        
        viewControllers = [mainNavigationController, cameraViewController, searchNavigationController, profileNavigationController]
        
        tabBar.translucent = false
        
        
        let topBorder = CALayer()
        topBorder.frame = CGRectMake(0, 0, 1000, 0.5)
        topBorder.backgroundColor = UIColor(red: 229/255, green: 231/255, blue: 235/255, alpha: 1).CGColor
        
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = false


    }
    
//    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
//
//    }
//    
//     func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController)
//    
//        }
    
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        if viewController == cameraViewController {
            self.presentViewController(cameraViewController, animated: true, completion: nil)
            return false
        }
        return true
        }

}

