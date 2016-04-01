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
        self.hideKeyboardWhenTappedAround()
        setupViews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let usernameTextField: UITextField = {
        
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .RoundedRect
        textField.keyboardType = .Default
        textField.autocorrectionType = .No

        return textField
    }()
    
    let passwordTextField: UITextField = {
        
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .RoundedRect
        textField.keyboardType = .Default
        textField.autocorrectionType = .No
        textField.secureTextEntry = true
    
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Highlighted)
        button.titleLabel?.textAlignment = .Center
        

        return button
    }()
    
    func loginButtonClicked(sender: UIButton!) {
        
        let registerViewController: UIViewController = RegisterViewController()
        navigationController?.pushViewController(registerViewController, animated: true)
        
    }
    
    let facebookButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "fblogin"), forState: .Normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    func setupViews() {
        
        view.backgroundColor = UIColor.whiteColor()
        
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(facebookButton)
        
        loginButton.addTarget(self, action: #selector(LoginViewController.loginButtonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        //horizontal constraints
        view.addConstraintsWithFormat("H:|-8-[v0]-8-|", options: nil, views: usernameTextField)
        view.addConstraintsWithFormat("H:|-8-[v0]-8-|", options: nil, views: passwordTextField)
        
        //defining the (horizontal) size
        view.addConstraintsWithFormat("H:[v0(250)]", options: nil, views: facebookButton)
        view.addConstraintsWithFormat("H:[v0(75)]", options: nil, views: loginButton)


        
        
        //vertical constraints
        view.addConstraintsWithFormat("V:|-80-[v0(50)]-8-[v1(50)]-10-[v2]", options: nil, views: usernameTextField, passwordTextField, loginButton)

        //defining the (vertical) size

        //center button (x,y or both)
         view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[view]-(<=0)-[newView(75)]", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["view": self.view, "newView": facebookButton]))
        
         view.centerHorizontallyWithSize(self.view, newView: loginButton, size: 45)
        
        
       
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

    func centerHorizontallyWithSize(superView: UIView, newView: UIView, size: NSInteger) {
        let format = "V:[view]-(<=0)-[newView(\(size))]"
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

