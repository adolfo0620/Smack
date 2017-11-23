//
//  ChatVC.swift
//  Smack
//
//  Created by adolfo reyes on 11/15/17.
//  Copyright © 2017 adolfo reyes. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    // Mark: Outlets
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                if success {
                    NotificationCenter.default.post(name: NOTIF_USer_DATA_DID_CHANGE, object: nil)
                }
            })
        }
        MessageService.instance.findAllChannel(){ (sucess) in
            print("sucessful load channels")
        }
        
    }
    

}
