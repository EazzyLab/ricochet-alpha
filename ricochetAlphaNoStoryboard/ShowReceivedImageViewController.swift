//
//  ShowReceivedImageViewController.swift
//  ricochetAlphaNoStoryboard
//
//  Created by Aidan Fuhrer on 08.04.16.
//  Copyright © 2016 ricochet. All rights reserved.
//

import UIKit




class ShowReceivedImageViewController: UIViewController {
    
    var image = UIImage(named: "picture_paris")
    var image2 = UIImage(named: "picture_lake")
    var image3 = UIImage(named: "picture_desert")
    var image4 = UIImage(named: "picture_street")

    
//
//    var image:UIImage?
//
    deinit{
        
        print("Deinit ShowReceivedPictureViewController")
        
        image = nil
        image2 = nil
        image3 = nil
        image4 = nil
    }
//
//    var pictureTest: PictureReceived? {
//        
//        didSet {
//            
//            if let imagePath = pictureTest?.imagePath {
//                image = UIImage(named: imagePath)
//                pictureImageView.image = image
//                backgroudImageView.image = image
//            }
//            
//            if let imageName = pictureTest?.name {
//                nameLabel.text = imageName
//            }
//            
//            if let info = pictureTest?.info {
//                pictureInfoLabel.text = info
//            }
//        }
//    }

    init() {
        super.init(nibName: nil, bundle: nil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.navigationBarHidden = true
        self.tabBarController?.tabBar.hidden = true
        
        setupViews()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false)
        
        let vcArray = navigationController?.viewControllers
        print(vcArray)
    }
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "close_button"), forState: .Normal)
        
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "like_button"), forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 37.5
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.7)
        button.layer.borderColor = UIColor(white: 1.0, alpha: 1).CGColor
        button.layer.borderWidth = 4.0
        button.contentMode = .Center

        return button
    }()
    
    let dislikeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "dislike_button"), forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 37.5
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.7)
        button.layer.borderColor = UIColor(white: 1.0, alpha: 1).CGColor
        button.layer.borderWidth = 4.0
        button.contentMode = .Center
        
        return button
    }()
    
    let commentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "comment_button"), forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.7)
        button.layer.borderColor = UIColor(white: 1.0, alpha: 1).CGColor
        button.layer.borderWidth = 3.0
        button.contentMode = .Center
        
        return button
    }()
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "follow_button"), forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.7)
        button.layer.borderColor = UIColor(white: 1.0, alpha: 1).CGColor
        button.layer.borderWidth = 3.0
        button.contentMode = .Center
        
        return button
    }()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFontOfSize(22)
        label.textColor = UIColor.whiteColor()
        label.textAlignment = .Center
        
        return label
    }()
    
    let pictureInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFontOfSize(14)
        label.textColor = UIColor.whiteColor()
        label.textAlignment = .Center
        
        return label
    }()
    
    let pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .ScaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true

        return imageView
    }()
    
    let backgroudImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .Center
        
        return imageView
    }()
    
    
    
    
    
    

    func setupViews() {
        
        view.addSubview(backgroudImageView)
        view.addSubview(pictureImageView)
        view.addSubview(closeButton)
        view.addSubview(likeButton)
        view.addSubview(dislikeButton)
        view.addSubview(nameLabel)
        view.addSubview(pictureInfoLabel)
        view.addSubview(commentButton)
        view.addSubview(moreButton)
//        
//        pictureImageView.image = image
//        backgroudImageView.image = image
        
        view.addConstraintsWithFormat("H:|[v0]|", options: nil, views: backgroudImageView)
        view.addConstraintsWithFormat("V:|[v0]|", options: nil, views: backgroudImageView)
        
        
        view.addConstraintsWithFormat("H:|-20-[v0]-20-|", options: nil, views: pictureImageView)
//        view.centerHorizontallyWithSize(self.view, newView: pictureImageView, size: nil)
        view.addConstraintsWithFormat("V:|-150-[v0]-150-|", options: nil, views: pictureImageView)
        
        view.addConstraintsWithFormat("H:|-20-[v0(35)]", options: nil, views: closeButton)
        view.addConstraintsWithFormat("V:|-20-[v0(35)]", options: nil, views: closeButton)
    
        view.addConstraintsWithFormat("H:[v0(75)]-86-|", options: nil, views: likeButton)
        view.addConstraintsWithFormat("V:[v0(75)]-55-|", options: nil, views: likeButton)
        
        view.addConstraintsWithFormat("H:|-86-[v0(75)]", options: nil, views: dislikeButton)
        view.addConstraintsWithFormat("V:[v0(75)]-55-|", options: nil, views: dislikeButton)
        
        view.addConstraintsWithFormat("H:|-38-[v0(50)]", options: nil, views: commentButton)
        view.addConstraintsWithFormat("V:[v0(50)]-75-|", options: nil, views: commentButton)
        
        view.addConstraintsWithFormat("H:[v0(50)]-38-|", options: nil, views: moreButton)
        view.addConstraintsWithFormat("V:[v0(50)]-75-|", options: nil, views: moreButton)
        
        view.centerHorizontallyWithSize(self.view, newView: nameLabel, size: nil)
        view.addConstraintsWithFormat("V:|-100-[v0(25)]", options: nil, views: nameLabel)
        
        view.centerHorizontallyWithSize(self.view, newView: pictureInfoLabel, size: nil)
        view.addConstraintsWithFormat("V:|-125-[v0(15)]", options: nil, views: pictureInfoLabel)
        
        var blurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.Dark))
        blurView.alpha = 0.97
        blurView.frame = self.view.bounds
        backgroudImageView.addSubview(blurView)
        
        closeButton.addTarget(self, action: #selector(self.closeButtonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    
    }
    
    func closeButtonClicked(sender: UIButton!) {
        
        pictureImageView.image = nil
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.popViewControllerAnimated(false)
    }
    
    func likeButtonClicked(sender: UIButton!) {
    
    }
    
    func dislikeButtonClicked(sender: UIButton!) {
        
    }
    
    func commentButtonClicked(sender: UIButton!) {
        
    }
    
    func moreButtonClicked(sender: UIButton!) {
    
    }


}
