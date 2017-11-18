//
//  Contants.swift
//  Smack
//
//  Created by adolfo reyes on 11/16/17.
//  Copyright © 2017 adolfo reyes. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL COnstants
let BASE_URL = "https://safe-bayou-88598.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCtreateAccount"
let UNWIND = "unwindToChannel"

//User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIN"
let USER_EMAIL = "userEmail"
