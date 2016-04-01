//
//  ViewController.swift
//  ricochetAlphaNoStoryboard
//
//  Created by Aidan Fuhrer on 30.03.16.
//  Copyright © 2016 ricochet. All rights reserved.
//

import UIKit



class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.hidden = true
        self.hideKeyboardWhenTappedAround()
        setupViews()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
       UIApplication.sharedApplication().statusBarHidden = true
    }
    
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
    func setupViews() {
        
        view.backgroundColor = UIColor(red: 191/255, green: 24/255, blue: 221/255, alpha: 1)
        
        view.addSubview(logoImageView)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(forgotPasswordButton)
        view.addSubview(registerButton)
        view.addSubview(takeTourButton)
        
        usernameTextField.addTarget(self, action: #selector(LoginViewController.updateUsernameTextField), forControlEvents: .EditingChanged)
        passwordTextField.addTarget(self, action: #selector(LoginViewController.updatePasswordTextField), forControlEvents: .EditingChanged)
        
   
    
        view.centerHorizontallyWithSize(self.view, newView: logoImageView, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: usernameTextField, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: passwordTextField, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: loginButton, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: forgotPasswordButton, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: registerButton, size: nil)
        view.centerHorizontallyWithSize(self.view, newView: takeTourButton, size: nil)
    
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: usernameTextField)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: passwordTextField)
        view.addConstraintsWithFormat("H:[v0(150)]", options: nil, views: logoImageView)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: loginButton)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: forgotPasswordButton)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: registerButton)
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: takeTourButton)

        view.addConstraintsWithFormat("V:|-100-[v0(50)]-20-[v1(35)]-10-[v2(35)]-10-[v3(35)]-10-[v4(15)]-5-[v5(15)]-5-[v6(15)]", options: nil, views: logoImageView, usernameTextField, passwordTextField, loginButton, forgotPasswordButton, registerButton, takeTourButton)
        
  
    }
    
    func updatePasswordTextField() {
        if passwordTextField.text == "" {
            loginButton.setTitleColor(UIColor(white: 1, alpha: 0.3), forState: .Normal)
        }else {
            loginButton.setTitleColor(UIColor(white: 1, alpha: 1), forState: .Normal)
        }
    
    }
    
    func updateUsernameTextField() {
        if usernameTextField.text == "" {
            loginButton.setTitleColor(UIColor(white: 1, alpha: 0.3), forState: .Normal)
        }else {
            loginButton.setTitleColor(UIColor(white: 1, alpha: 1), forState: .Normal)
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