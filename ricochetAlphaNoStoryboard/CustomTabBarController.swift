//
//  CustomTabBarController.swift
//  ricochetAlphaNoStoryboard
//
//  Created by Aidan Fuhrer on 02.04.16.
//  Copyright © 2016 ricochet. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {

    
    let cameraTabButton = UIViewController()
    let cameraController = CameraViewController()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        self.delegate = self
        
        let mainCollectionViewLayout = UICollectionViewFlowLayout()
        mainCollectionViewLayout.minimumInteritemSpacing = 0
        mainCollectionViewLayout.minimumLineSpacing = 0
        let mainController = MainViewController(collectionViewLayout: mainCollectionViewLayout)
        let mainNavigationController = UINavigationController(rootViewController: mainController)
        mainNavigationController.title = "Received"
        mainNavigationController.tabBarItem.image = UIImage(named: "icon_received")
        
        let sentPictures = SentPicturesViewController()
        let sentPicturesNavigationController = UINavigationController(rootViewController: sentPictures)
        sentPicturesNavigationController.title = "Sent"
        sentPicturesNavigationController.tabBarItem.image = UIImage(named: "icon_sent")
        
        
        cameraTabButton.title = "Create"
        cameraTabButton.tabBarItem.image = UIImage(named: "icon_create")
        
        
        let searchController = SearchViewController()
        let searchNavigationController = UINavigationController(rootViewController: searchController)
        searchNavigationController.title = "Cemetery"
        searchNavigationController.tabBarItem.image = UIImage(named: "icon_cemetery")
        
        let profileController = UIViewController()
        let profileNavigationController = UINavigationController(rootViewController: profileController)
        profileNavigationController.title = "Profile"
        profileNavigationController.tabBarItem.image = UIImage(named: "icon_profile")
        
        
        viewControllers = [mainNavigationController, sentPicturesNavigationController, cameraTabButton, searchNavigationController, profileNavigationController]
        
        tabBar.translucent = false
        
        
        let topBorder = CALayer()
        topBorder.frame = CGRectMake(0, 0, 1000, 0.5)
        topBorder.backgroundColor = UIColor(red: 229/255, green: 231/255, blue: 235/255, alpha: 1).CGColor
        
        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = false


    }
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        
        if viewController == cameraTabButton {
        
            self.presentViewController(cameraController, animated: true, completion: nil)
            return false
        }else {
        
            return true
        }
        
    }
}

