//
//  MainViewController.swift
//  ricochetAlphaNoStoryboard
//
//  Created by Aidan Fuhrer on 02.04.16.
//  Copyright © 2016 ricochet. All rights reserved.
//

import UIKit

var loggedIn = true
let cellId = "cellId"



class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var pictures = [PictureReceived]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //seeding the array
        
        let pictureA = PictureReceived()
        pictureA.name = "Paris by Night"
        pictureA.date = "Few seconds ago"
        pictureA.opened = false
        pictureA.imagePath = "picture_paris"
        pictureA.info = "A little shot of the Eiffel tower"
        
        let pictureB = PictureReceived()
        pictureB.name = "Beautiful Lake"
        pictureB.date = "An hour ago"
        pictureB.opened = false
        pictureB.imagePath = "picture_lake"
        pictureB.info = "Afternoon by the lake"
        
        let pictureC = PictureReceived()
        pictureC.name = "Blue Desert"
        pictureC.date = "An hour ago"
        pictureC.opened = false
        pictureC.imagePath = "picture_desert"
        pictureC.info = "Lost in the middle of the desert"
        
        
        let pictureD = PictureReceived()
        pictureD.name = "Riding under the sun"
        pictureD.date = "Opened few hours ago"
        pictureD.opened = true
        pictureD.imagePath = "picture_street"
        pictureD.info = "Californian streets in BMX"
        
        pictures.append(pictureA)
        pictures.append(pictureB)
        pictures.append(pictureC)
        pictures.append(pictureD)
        
        self.navigationController?.navigationBar.barTintColor = UIColor.rgb(142, green: 68, blue: 173)
        collectionView?.backgroundColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationItem.title = "Pictures Received"
        
        
        collectionView?.alwaysBounceVertical = true
        collectionView?.delaysContentTouches = false
        collectionView?.registerClass(NotificationCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        let vcArray = navigationController?.viewControllers
        print(vcArray)
        
        navigationController?.navigationBar.hidden = false
    
        
        if !loggedIn {
            
            let loginController = LoginViewController()
//            navigationController?.pushViewController(loginController, animated: true)
            self.navigationController?.pushViewController(loginController, animated: true)
        }
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let notificationCell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! NotificationCell
        
        notificationCell.picture = pictures[indexPath.item]
        
        return notificationCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(view.frame.width, 60)
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
//        let picture = pictures[indexPath.item]
        let showReceivedController = ShowReceivedImageViewController()
////        showReceivedController.picture?.name = pictures[indexPath.item].name
//        showReceivedController.pictureTest = picture
     
        navigationController?.pushViewController(showReceivedController, animated: false)
    }
    
    override func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        
        collectionView.cellForItemAtIndexPath(indexPath)?.backgroundColor = UIColor.lightGrayColor()
    }
    
    override func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        
        collectionView.cellForItemAtIndexPath(indexPath)?.backgroundColor = UIColor.whiteColor()
    }

}

class NotificationCell: UICollectionViewCell {
    
    var notificationImageNotOpened = UIImage(named: "image_received")
    var notificationImageOpened = UIImage(named: "image_received_opened")
    
    var picture: PictureReceived? {
        
        didSet {
            
            if let name = picture?.name {
                pictureNameLabel.text = name
            }
        
            if let date = picture?.date {
                pictureInfoLabel.text = date
            }
            
            if let opened = picture?.opened {
                if opened {
                    notificationImageView.image = notificationImageOpened
                }else {
                    notificationImageView.image = notificationImageNotOpened
                }
            
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    let notificationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "image_received")
        
        return imageView
    }()
    
    let pictureNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Picture Swag"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFontOfSize(14)
        label.textAlignment = .Left
        
    
        return label
    }()
    
    let pictureInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A few seconds ago"
        label.font = UIFont.systemFontOfSize(10)
        label.textColor = UIColor.lightGrayColor()
        label.textAlignment = .Left
        
        return label
    }()
    
    let dividerLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(226, green: 228, blue: 232)
        
        return view
    }()
    func setupViews() {
        backgroundColor = UIColor.whiteColor()
        
        addSubview(notificationImageView)
        addSubview(pictureNameLabel)
        addSubview(pictureInfoLabel)
        addSubview(dividerLine)
        
        
        addConstraintsWithFormat("H:|-15-[v0(30)]", options: nil, views: notificationImageView)
        addConstraintsWithFormat("V:|-15-[v0(30)]-15-|", options: nil, views: notificationImageView)
        
        addConstraintsWithFormat("H:|-60-[v0]", options: nil, views: pictureNameLabel)
        addConstraintsWithFormat("V:|-15-[v0(15)]-5-[v1(12)]-13-|", options: nil, views: pictureNameLabel, pictureInfoLabel)
        
        addConstraintsWithFormat("H:|-60-[v0]", options: nil, views: pictureInfoLabel)

        
        addConstraintsWithFormat("H:|[v0]|", options: nil, views: dividerLine)
        addConstraintsWithFormat("V:[v0(0.7)]-0-|", options: nil, views: dividerLine)
    }
}
