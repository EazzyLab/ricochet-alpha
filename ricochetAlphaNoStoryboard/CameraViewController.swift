//
//  CameraViewController.swift
//  ricochetAlphaNoStoryboard
//
//  Created by Aidan Fuhrer on 02.04.16.
//  Copyright © 2016 ricochet. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var captureSession : AVCaptureSession?
    var stillImageOutput : AVCaptureStillImageOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?
    var superViewBounds: CGRect!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.hidesBottomBarWhenPushed = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.hidden = true
        
        superViewBounds = self.view.bounds
//        let tempViewBounds = self.view.bounds
//
//        
//        
//        if let height = tabBarHeight {
//        let tempViewBounds = self.view.bounds
//        superViewBounds = CGRectMake(tempViewBounds.origin.x, tempViewBounds.origin.y, tempViewBounds.width, tempViewBounds.height - height)
//        } else {
//            superViewBounds = self.view.bounds
//        }
        
        self.navigationController?.navigationBarHidden = true
        setupViews()
        
    }
    
  
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(false)
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
         var backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        
        do {
            
            var input = try AVCaptureDeviceInput(device: backCamera)
            
            if ((captureSession?.canAddInput(input)) != nil) {
            
                captureSession?.addInput(input)
                
                stillImageOutput = AVCaptureStillImageOutput()
                stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
                
                if (captureSession?.canAddOutput(stillImageOutput) != nil){
                    captureSession?.addOutput(stillImageOutput)
                    
                    previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                    previewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
                    previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
                    cameraView.layer.addSublayer(previewLayer!)
                    captureSession?.startRunning()
                    
                }
            
            }
            
        }catch {print(error)}
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(false)
        
        print("Camera View Did Appear")
        
        print("View Did Appear : SuperView Bounds : " + String(self.view.bounds))
        print("View Did Appear : CameraView Bounds : " + String(cameraView.bounds))
        
        previewLayer?.frame = superViewBounds
    }
    
    
    let cameraView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let takePictureButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clearColor()
        button.layer.cornerRadius = 32.5
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.3)
        button.layer.borderColor = UIColor(white: 1.0, alpha: 1).CGColor
        button.layer.borderWidth = 2.0
        
        return button
    }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "close_button"), forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    func setupViews() {
        
//        tabBarController?.view.addSubview(cameraView)
//        cameraView.addSubview(takePictureButton)
//        
//        tabBarController?.view.bounds
//        tabBarController?.view.addConstraintsWithFormat("H:|[v0]|", options: nil, views: cameraView)
//        tabBarController?.view.addConstraintsWithFormat("V:|[v0]|", options: nil, views: cameraView)
//
//        cameraView.centerHorizontallyWithSize(cameraView, newView: takePictureButton, size: nil)
//        cameraView.addConstraintsWithFormat("H:[v0(65)]", options: nil, views: takePictureButton)
//        cameraView.addConstraintsWithFormat("V:[v0(65)]-15-|", options: nil, views: takePictureButton)
        
        view.addSubview(cameraView)
        view.addSubview(takePictureButton)
        view.addSubview(closeButton)
        
        view.centerHorizontallyWithSize(self.view, newView: takePictureButton, size: nil)
        view.addConstraintsWithFormat("H:[v0(65)]", options: nil, views: takePictureButton)
        view.addConstraintsWithFormat("V:[v0(65)]-15-|", options: nil, views: takePictureButton)
        
        view.addConstraintsWithFormat("H:|-20-[v0(50)]", options: nil, views: closeButton)
        view.addConstraintsWithFormat("V:|-20-[v0(50)]", options: nil, views: closeButton)
        
        print("SuperView Bounds : " + String(view.bounds))
        print("CameraView Bounds : " + String(cameraView.bounds))
        
          takePictureButton.addTarget(self, action: #selector(self.takePictureButtonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        
    
    }
    
    func takePictureButtonClicked(sender: UIButton!) {
        
        let vcArray = self.navigationController?.viewControllers
        print(vcArray)
//        let picturePreviewController = PicturePreviewViewController()
//        self.navigationController?.pushViewController(picturePreviewController, animated: false)
//        cameraView.backgroundColor = UIColor.cyanColor()
        
//        navigationController?.popViewControllerAnimated(true)
        
//        self.tabBarController?.selectedIndex = 0
        
        self.dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    func closeButtonClicked(sender: UIButton!) {
        
        navigationController?.popViewControllerAnimated(true)
        
    
    }

    
}
