//
//  UserDataSerivce.swift
//  Smack
//
//  Created by adolfo reyes on 11/18/17.
//  Copyright © 2017 adolfo reyes. All rights reserved.
//

import Foundation

class UserDataSerivce {
    static let instance = UserDataSerivce()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String){
        self.id = id
        self.avatarColor = color
        self.email = email
        self.name = name
        self.avatarName = avatarName
    }
    
    func setAvatarName(avatarName: String){
        self.avatarName = avatarName
    }
}
