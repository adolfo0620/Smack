//
//  ProfileVCViewController.swift
//  Smack
//
//  Created by adolfo reyes on 11/20/17.
//  Copyright © 2017 adolfo reyes. All rights reserved.
//

import UIKit

class ProfileVCViewController: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }

    @IBAction func closeModalPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func logoutPressed(_ sender: Any) {
        UserDataSerivce.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USer_DATA_DID_CHANGE, object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupView(){
        profileImg.image = UIImage(named: UserDataSerivce.instance.avatarName)
        profileImg.backgroundColor = UserDataSerivce.instance.returnUIColor(components: UserDataSerivce.instance.avatarColor)
        userName.text = UserDataSerivce.instance.name
        userEmail.text = UserDataSerivce.instance.email
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVCViewController.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
}
