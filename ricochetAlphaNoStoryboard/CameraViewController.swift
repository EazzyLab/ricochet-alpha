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
    var backCamera: AVCaptureDevice?
    var flash: Bool = false
    var inPreviewMode: Bool = false
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.hidesBottomBarWhenPushed = true
    }
    
    deinit {
        print("deinit CameraViewController")
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
        
        flash = false
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
//        if (backCamera!.hasFlash){
//            do {
//                try backCamera!.lockForConfiguration()
//                if (backCamera!.flashMode == AVCaptureFlashMode.Off && flash == true) {
//                    backCamera!.flashMode = AVCaptureFlashMode.On
//                    print("flash On")
//                }else if (backCamera!.flashMode == AVCaptureFlashMode.On && flash == false){
//                    backCamera!.flashMode = AVCaptureFlashMode.Off
//                    print("flash Off")
//                }
//                backCamera.unlockForConfiguration()
//            }catch {
//                print(error)
//            }
//        }
//        
        
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
    
    let galleryButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "gallery_button"), forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let flashButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "flashOn_button"), forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let previewPictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.hidden = true
    
        return imageView
    }()
    
    let sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "send_button"), forState: .Normal)
        button.hidden = true
        
        return button
    }()

    func setupViews() {
        
        
        view.addSubview(cameraView)
        view.addSubview(previewPictureImageView)
        view.addSubview(takePictureButton)
        view.addSubview(closeButton)
        view.addSubview(galleryButton)
        view.addSubview(flashButton)
        view.addSubview(sendButton)
        
        view.addConstraintsWithFormat("H:|[v0]|", options: nil, views: previewPictureImageView)
        view.addConstraintsWithFormat("V:|[v0]|", options: nil, views: previewPictureImageView)
        
        view.centerHorizontallyWithSize(self.view, newView: takePictureButton, size: nil)
        view.addConstraintsWithFormat("H:[v0(65)]", options: nil, views: takePictureButton)
        view.addConstraintsWithFormat("V:[v0(65)]-15-|", options: nil, views: takePictureButton)
        
        view.addConstraintsWithFormat("H:|-20-[v0(35)]", options: nil, views: closeButton)
        view.addConstraintsWithFormat("V:|-20-[v0(35)]", options: nil, views: closeButton)
        
        view.addConstraintsWithFormat("H:|-25-[v0(25)]", options: nil, views: galleryButton)
        view.addConstraintsWithFormat("V:[v0(25)]-32.5-|", options: nil, views: galleryButton)
        
        view.addConstraintsWithFormat("H:[v0(30)]-20-|", options: nil, views: flashButton)
        view.addConstraintsWithFormat("V:|-20-[v0(30)]", options: nil, views: flashButton)
        
        view.addConstraintsWithFormat("H:[v0(50)]-50-|", options: nil, views: sendButton)
        view.addConstraintsWithFormat("V:[v0(50)]-45-|", options: nil, views: sendButton)
        

        
        
          takePictureButton.addTarget(self, action: #selector(self.takePictureButtonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        closeButton.addTarget(self, action: #selector(self.closeButtonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        flashButton.addTarget(self, action: #selector(self.flashButtonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        galleryButton.addTarget(self, action: #selector(self.galleryButtonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        
    
    }
    
    func galleryButtonClicked(sender: UIButton!) {
        
        var imagePicker = UIImagePickerController()
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        previewPictureImageView.image = image
        self.previewPictureImageView.hidden = false
        self.inPreviewMode = true
        self.flashButton.hidden = true
        self.takePictureButton.hidden = true
        self.galleryButton.hidden = true
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func takePictureButtonClicked(sender: UIButton!) {
        
        if flash {
            if (backCamera!.hasFlash) {
                do {
                    try backCamera?.lockForConfiguration()
                    backCamera?.flashMode = AVCaptureFlashMode.On
                    backCamera?.unlockForConfiguration()
                }catch {
                print(error)
                }
            }
        }else {
            do {
                try backCamera?.lockForConfiguration()
                backCamera?.flashMode = AVCaptureFlashMode.Off
                backCamera?.unlockForConfiguration()
            }catch {
                print(error)
            }
        }
        
        if let  videoConnection = stillImageOutput?.connectionWithMediaType(AVMediaTypeVideo) {
            videoConnection.videoOrientation = AVCaptureVideoOrientation.Portrait
            stillImageOutput?.captureStillImageAsynchronouslyFromConnection(videoConnection, completionHandler: {(sampleBuffer, error) in
                
                if sampleBuffer != nil {
                    
                    var imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                    var dataProvider = CGDataProviderCreateWithCFData(imageData)
                    var cgImageRef = CGImageCreateWithJPEGDataProvider(dataProvider, nil, true, .RenderingIntentDefault)
                    
                    var image = UIImage(CGImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.Right)
                    
                    self.previewPictureImageView.image = image
                    self.previewPictureImageView.hidden = false
                    self.inPreviewMode = true
                    self.flashButton.hidden = true
                    self.takePictureButton.hidden = true
                    self.galleryButton.hidden = true
                    self.sendButton.hidden = false

                }
            })
        }
    }
    
    func closeButtonClicked(sender: UIButton!) {
        
        if inPreviewMode {
            previewPictureImageView.hidden = true
            self.flashButton.hidden = false
            self.takePictureButton.hidden = false
            self.galleryButton.hidden = false
            inPreviewMode = false
            self.sendButton.hidden = true
        }else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    
    }
    
    func flashButtonClicked(sender: UIButton!) {
        
//        if (backCamera.hasFlash){
//            do {
//                try backCamera.lockForConfiguration()
//                if (backCamera.flashMode == AVCaptureFlashMode.Off && flash == true) {
//                    backCamera.flashMode = AVCaptureFlashMode.On
//                    print("flash On")
//                }else if (backCamera.flashMode == AVCaptureFlashMode.On && flash == false){
//                    backCamera.flashMode = AVCaptureFlashMode.Off
//                    print("flash Off")
//                }
//                backCamera.unlockForConfiguration()
//            }catch {
//                print(error)
//            }
//        }
        
        
        if flash == true {
            flashButton.setBackgroundImage(UIImage(named: "flashOn_button"), forState: .Normal)
            flash = false
            
            }
        else if flash == false {
            
            flashButton.setBackgroundImage(UIImage(named: "flashOff_button"), forState: .Normal)
            flash = true
        }
    }
}
