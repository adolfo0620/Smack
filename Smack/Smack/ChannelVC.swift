//
//  ChannelVC.swift
//  Smack
//
//  Created by adolfo reyes on 11/15/17.
//  Copyright © 2017 adolfo reyes. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }


}
