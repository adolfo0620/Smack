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
    }
    

}
