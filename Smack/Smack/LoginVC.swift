//
//  LoginVC.swift
//  Smack
//
//  Created by adolfo reyes on 11/16/17.
//  Copyright © 2017 adolfo reyes. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated:true, completion: nil)
    }
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }

}
