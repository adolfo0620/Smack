//
//  CreateAccountVC.swift
//  Smack
//
//  Created by adolfo reyes on 11/16/17.
//  Copyright © 2017 adolfo reyes. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    // MARK: Outlets
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataSerivce.instance.avatarName != "" {
            userImg.image = UIImage(named: UserDataSerivce.instance.avatarName)
            avatarName = UserDataSerivce.instance.avatarName
            
            if avatarName.contains("light") && bgColor == nil {
                userImg.backgroundColor = UIColor.lightGray
            }
        }
    }
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func createAccntPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let pass = passwordTxt.text , passwordTxt.text != "" else { return }
        guard let name = usernameTxt.text , usernameTxt.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginuser(email: email, password: pass, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                                    if success {
                                        
                                        self.spinner.isHidden = true
                                        self.spinner.stopAnimating()
                                        self.performSegue(withIdentifier: UNWIND, sender: nil)
                                        
                                        NotificationCenter.default.post(name: NOTIF_USer_DATA_DID_CHANGE, object: nil)
                                        
                                    }
                                })
                            }
                        })
                    }
                })
            }
        }
    }
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pcikBGColorPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        
        UIView.animate(withDuration: 0.2){
            self.userImg.backgroundColor = self.bgColor
        }
    }
    
    func setupView(){
        spinner.isHidden = true
        usernameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [ NSForegroundColorAttributeName: smackPurplePlaceholser])
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [ NSForegroundColorAttributeName: smackPurplePlaceholser])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [ NSForegroundColorAttributeName: smackPurplePlaceholser])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    func handleTap(){
        view.endEditing(true)
    }
}
