//
//  ViewController.swift
//  ricochetAlphaNoStoryboard
//
//  Created by Aidan Fuhrer on 30.03.16.
//  Copyright © 2016 ricochet. All rights reserved.
//

import UIKit
import AVFoundation



class LoginViewController: UIViewController {
    
    var keyoardNotificationBool: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tabBarController?.tabBar.hidden = true
        self.navigationController?.navigationBar.hidden = true
        self.hideKeyboardWhenTappedAround()
        
        keyoardNotificationBool = true

        
        //section for animated keyboard
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        
        setupViews()
        
    }
    
    
    
    deinit {
    
        print("deInit login View Controller")
    }
    
    override func viewDidAppear(animated: Bool) {

    }
    
    override func viewDidDisappear(animated: Bool) {
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
       UIApplication.sharedApplication().statusBarHidden = true
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
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", forState: .Normal)
        button.backgroundColor = UIColor.clearColor()
        button.titleLabel?.font = UIFont.boldSystemFontOfSize(13)
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor(white: 1.0, alpha: 0.3).CGColor
        button.layer.borderWidth = 2.0
        button.setTitleColor(UIColor(white: 1.0, alpha: 0.3), forState: .Normal)
        button.userInteractionEnabled = false
        
        
        return button
    }()
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot your password ?", forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(white: 1.0, alpha: 1.0), forState: .Normal)
        button.setTitleColor(UIColor(white: 1.0, alpha: 0.5), forState: .Highlighted)
        button.titleLabel?.font = UIFont.systemFontOfSize(13)
        button.titleLabel?.textAlignment = .Center
        
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("You don't have an account ? Sign up.", forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(white: 1.0, alpha: 1.0), forState: .Normal)
        button.setTitleColor(UIColor(white: 1.0, alpha: 0.5), forState: .Highlighted)
        button.titleLabel?.font = UIFont.systemFontOfSize(13)
        button.titleLabel?.textAlignment = .Center
        
        return button
    }()
    
    let takeTourButton: UIButton = {
        let button = UIButton()
        button.setTitle("Take a tour without signing in !", forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(white: 1.0, alpha: 1.0), forState: .Normal)
        button.setTitleColor(UIColor(white: 1.0, alpha: 0.5), forState: .Highlighted)
        button.titleLabel?.font = UIFont.systemFontOfSize(13)
        button.titleLabel?.textAlignment = .Center
        
        return button
    }()
    
    let loginActivityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = UIColor(white: 1, alpha: 1)
        activityIndicator.hidesWhenStopped = true
    
        return activityIndicator
    }()
    func setupViews() {
        
        view.addSubview(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordButton)
        view.addSubview(registerButton)
        view.addSubview(takeTourButton)
        view.addSubview(loginActivityIndicator)
        
        usernameTextField.addTarget(self, action: #selector(LoginViewController.updateUsernameTextField), forControlEvents: .EditingChanged)
        passwordTextField.addTarget(self, action: #selector(LoginViewController.updatePasswordTextField), forControlEvents: .EditingChanged)
        registerButton.addTarget(self, action: #selector(LoginViewController.registerButtonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        loginButton.addTarget(self, action: #selector(self.loginButtonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
   
    
        view.centerHorizontallyWithSize(self.view, newView: logoImageView, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: usernameTextField, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: passwordTextField, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: loginButton, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: forgotPasswordButton, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: registerButton, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: takeTourButton, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: loginActivityIndicator, size: nil)
        
//        view.addConstraintsWithFormat("H:|[v0]|", options: nil, views: backgroundImageView)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: usernameTextField)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: passwordTextField)
        view.addConstraintsWithFormat("H:[v0(150)]", options: nil, views: logoImageView)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: loginButton)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: forgotPasswordButton)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: registerButton)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: takeTourButton)

        view.addConstraintsWithFormat("V:|[v0]|", options: nil, views: backgroundImageView)
        view.addConstraintsWithFormat("V:|-200-[v0(50)]-15-[v1(35)]-10-[v2(35)]-10-[v3(35)]-10-[v4(15)]-5-[v5(15)]-5-[v6(15)]", options: nil, views: logoImageView, usernameTextField, passwordTextField, loginButton, forgotPasswordButton, registerButton, takeTourButton)
        view.addConstraintsWithFormat("V:|-356-[v0(35)]", options: nil, views: loginActivityIndicator)

        
  
    }
    
    func loginButtonClicked(sender: UIButton!) {
        loginButton.setTitle("", forState: .Normal)
        loginActivityIndicator.startAnimating()
        
        if usernameTextField.text == "Anjou" && passwordTextField.text == "Password" {
            loggedIn = true
            loginActivityIndicator.stopAnimating()
            navigationController?.popViewControllerAnimated(true)
            
        }else {
            loginActivityIndicator.stopAnimating()
            usernameTextField.text = ""
            passwordTextField.text = ""
            let alertWrongCredentials = UIAlertController(title: "Wrong credentials", message: "Incorrect login credentials", preferredStyle: .Alert)
            alertWrongCredentials.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            loginButton.setTitle("Login", forState: .Normal)
            presentViewController(alertWrongCredentials, animated: true, completion: nil)
        }
    }
    
    func updatePasswordTextField() {
        if passwordTextField.text == "" || usernameTextField.text == "" {
            loginButton.setTitleColor(UIColor(white: 1, alpha: 0.3), forState: .Normal)
            loginButton.userInteractionEnabled = false
        }else {
            loginButton.setTitleColor(UIColor(white: 1, alpha: 1), forState: .Normal)
            loginButton.userInteractionEnabled = true
        }
    }
    
    func updateUsernameTextField() {
        if usernameTextField.text == "" || passwordTextField.text == "" {
            loginButton.setTitleColor(UIColor(white: 1, alpha: 0.3), forState: .Normal)
            loginButton.userInteractionEnabled = false
        }else {
            loginButton.setTitleColor(UIColor(white: 1, alpha: 1), forState: .Normal)
            loginButton.userInteractionEnabled = true
        }
    }
    
    func registerButtonClick(sender: UIButton!) {
        
        let registerViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
        
        let vcArray = self.navigationController?.viewControllers
        print(vcArray)
    
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
extension UIViewController {

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

}
extension UIView {

    func centerHorizontallyWithSize(superView: UIView, newView: UIView, size: NSInteger?) {
        
        var format:String
        if let specifiedSize = size {
             format = "V:[view]-(<=0)-[newView(\(specifiedSize))]"
        }else {
             format = "V:[view]-(<=0)-[newView]"
        }
        superView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["view": superView, "newView": newView]))
    }
    func centerVerticallyWithSize(superView: UIView, newView: UIView, size: NSInteger?){
        
        var format:String
        if let specifiedSize = size {
            format = "V:[view]-(<=0)-[newView(\(specifiedSize))]"
        }else {
            format = "V:[view]-(<=0)-[newView]"
        }
        superView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions.AlignAllCenterY, metrics: nil, views: ["view": superView, "newView": newView]))
    }
    func addConstraintsWithFormat(format: String, options:NSLayoutFormatOptions?, views: UIView...) {
        var viewsDictionnary = [String: UIView]()
        for (index, view) in views.enumerate() {
            let key = "v\(index)"
            viewsDictionnary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionnary))
    }
}

class CustomTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5);
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return self.newBounds(bounds)
    }
    
    override func placeholderRectForBounds(bounds: CGRect) -> CGRect {
        return self.newBounds(bounds)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return self.newBounds(bounds)
    }
    
    private func newBounds(bounds: CGRect) -> CGRect {
        
        var newBounds = bounds
        newBounds.origin.x += padding.left
        newBounds.origin.y += padding.top
        newBounds.size.height -= padding.top + padding.bottom
        newBounds.size.width -= padding.left + padding.right
        return newBounds
    }
}

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
}
