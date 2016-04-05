//
//  RegisterViewController.swift
//  ricochetAlphaNoStoryboard
//
//  Created by Aidan Fuhrer on 31.03.16.
//  Copyright © 2016 ricochet. All rights reserved.
//

import UIKit


class RegisterViewController: UIViewController {
    
    var keyoardNotificationBool:Bool!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        keyoardNotificationBool = true
        self.tabBarController?.tabBar.hidden = true
        
        
        self.hideKeyboardWhenTappedAround()
        
   
        
        //section for animated keyboard
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RegisterViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RegisterViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        //adding subViews
        setupViews()
    }
    
    deinit {
    
        print("deinit register View Controller")    
    }
    override func viewDidAppear(animated: Bool) {
     
    }
    
    override func viewDidDisappear(animated: Bool) {

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
//        UIApplication.sharedApplication().statusBarHidden = true
    }
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "backgroundLogin")
        imageView.contentMode = .ScaleAspectFill
        
        return imageView
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .ScaleAspectFit
        imageView.image = UIImage(named: "logoRicochet")
        
        return imageView
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Share your pictures with the world"
        label.textColor = UIColor.whiteColor()
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
    
        return label
    }()
    
    let emailTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Email adress"
        textField.layer.cornerRadius = 5
        textField.backgroundColor = UIColor(white: 1, alpha: 0.2)
        textField.setValue(UIColor.whiteColor(), forKeyPath: "_placeholderLabel.textColor")
        textField.textColor = UIColor.whiteColor()
        textField.clearButtonMode = .WhileEditing
        textField.autocorrectionType = .No
        textField.font = UIFont.systemFontOfSize(14)
        textField.tintColor = UIColor.whiteColor()
        
        return textField
    }()
    
    let usernameTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Username"
        textField.layer.cornerRadius = 5
        textField.backgroundColor = UIColor(white: 1, alpha: 0.2)
        textField.setValue(UIColor.whiteColor(), forKeyPath: "_placeholderLabel.textColor")
        textField.textColor = UIColor.whiteColor()
        textField.clearButtonMode = .WhileEditing
        textField.autocorrectionType = .No
        textField.font = UIFont.systemFontOfSize(14)
        textField.tintColor = UIColor.whiteColor()
        
        return textField
    }()
    
    let passwordTextField: CustomTextField = {
        let textField = CustomTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 5
        textField.backgroundColor = UIColor(white: 1, alpha: 0.2)
        textField.setValue(UIColor.whiteColor(), forKeyPath: "_placeholderLabel.textColor")
        textField.textColor = UIColor.whiteColor()
        textField.clearButtonMode = .WhileEditing
        textField.autocorrectionType = .No
        textField.font = UIFont.systemFontOfSize(14)
        textField.tintColor = UIColor.whiteColor()
        textField.secureTextEntry = true
        
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", forState: .Normal)
        button.backgroundColor = UIColor.clearColor()
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(13)
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor(white: 1.0, alpha: 0.3).CGColor
        button.layer.borderWidth = 2.0
        button.setTitleColor(UIColor(white: 1.0, alpha: 0.3), forState: .Normal)
        
        
        return button
    }()
    
    let termsLabel: UILabel = {
        let label = UILabel()
        label.text = "By registering, you agree to our Terms of Conditions and Privacy Policy"
        label.textColor = UIColor.whiteColor()
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        
        
        return label
    }()
    
    let goToLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("You have an account ? Login.", forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(white: 1.0, alpha: 1.0), forState: .Normal)
        button.setTitleColor(UIColor(white: 1.0, alpha: 0.5), forState: .Highlighted)
        button.titleLabel?.font = UIFont.systemFontOfSize(14)
        button.titleLabel?.textAlignment = .Center
        
        return button
    }()
    
  


    
    func setupViews() {
        
        view.addSubview(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(subtitleLabel)
        view.addSubview(emailTextField)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        view.addSubview(termsLabel)
        view.addSubview(goToLoginButton)
        
        emailTextField.addTarget(self, action: #selector(RegisterViewController.updateEmailTextField), forControlEvents: .EditingChanged)
        usernameTextField.addTarget(self, action: #selector(RegisterViewController.updateUsernameTextField), forControlEvents: .EditingChanged)
        passwordTextField.addTarget(self, action: #selector(RegisterViewController.updatePasswordTextField), forControlEvents: .EditingChanged)
        goToLoginButton.addTarget(self, action: #selector(self.goToLoginButtonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        view.centerHorizontallyWithSize(self.view, newView: logoImageView, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: subtitleLabel, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: emailTextField, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: usernameTextField, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: passwordTextField, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: registerButton, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: termsLabel, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: goToLoginButton, size: nil)
        
        view.centerHorizontallyWithSize(self.view, newView: logoImageView, size: nil)
        view.addConstraintsWithFormat("H:[v0(150)]", options: nil, views: logoImageView)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: emailTextField)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: usernameTextField)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: passwordTextField)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: registerButton)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: termsLabel)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: goToLoginButton)
        
        view.addConstraintsWithFormat("V:|[v0]|", options: nil, views: backgroundImageView)
        view.addConstraintsWithFormat("V:|-150-[v0(50)]-[v1(25)]-15-[v2(35)]-10-[v3(35)]-10-[v4(35)]-10-[v5(35)]-10-[v6(35)]-10-[v7(15)]", options: nil, views: logoImageView, subtitleLabel, emailTextField, usernameTextField, passwordTextField, registerButton, termsLabel, goToLoginButton)
        
    
    }
    
    func goToLoginButtonClicked(sender: UIButton!) {
        
       navigationController?.popViewControllerAnimated(true)
        
        let vcArray = self.navigationController?.viewControllers
        print(vcArray)
    
    }
    
    func updatePasswordTextField() {
        if usernameTextField.text == "" || passwordTextField.text == "" || emailTextField.text == "" {
            registerButton.setTitleColor(UIColor(white: 1, alpha: 0.3), forState: .Normal)
        }else {
            registerButton.setTitleColor(UIColor(white: 1, alpha: 1), forState: .Normal)
        }
    }
    
    func updateUsernameTextField() {
        if usernameTextField.text == "" || passwordTextField.text == "" || emailTextField.text == "" {
            registerButton.setTitleColor(UIColor(white: 1, alpha: 0.3), forState: .Normal)
        }else {
            registerButton.setTitleColor(UIColor(white: 1, alpha: 1), forState: .Normal)
        }
    }
    
    func updateEmailTextField() {
        if usernameTextField.text == "" || passwordTextField.text == "" || emailTextField.text == "" {
            registerButton.setTitleColor(UIColor(white: 1, alpha: 0.3), forState: .Normal)
        }else {
            registerButton.setTitleColor(UIColor(white: 1, alpha: 1), forState: .Normal)
        }
    }
    
    
    func keyboardWillShow(notification: NSNotification) {
        
        if keyoardNotificationBool == true {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                self.view.frame.origin.y -= keyboardSize.height
            }
            keyoardNotificationBool = false
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if keyoardNotificationBool == false {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
                self.view.frame.origin.y += keyboardSize.height
            }
            keyoardNotificationBool = true
        }
    }

}
