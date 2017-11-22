//
//  ChannelVC.swift
//  Smack
//
//  Created by adolfo reyes on 11/15/17.
//  Copyright © 2017 adolfo reyes. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    @IBOutlet weak var userImg: CircleImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange), name: NOTIF_USer_DATA_DID_CHANGE, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            let profile = ProfileVCViewController()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        }else{
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    @objc func userDataDidChange(_ notif: Notification){
        setupUserInfo()
    }
    
    func setupUserInfo(){
        if AuthService.instance.isLoggedIn{
            loginBtn.setTitle(UserDataSerivce.instance.name, for: .normal)
            userImg.image = UIImage(named: UserDataSerivce.instance.avatarName)
            userImg.backgroundColor = UserDataSerivce.instance.returnUIColor(components: UserDataSerivce.instance.avatarColor)
            
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImg.image = UIImage(named: "menuProfileIcon")
            userImg.backgroundColor = UIColor.clear
        }
    }
    
    
}
