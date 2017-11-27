//
//  MessageCell.swift
//  Smack
//
//  Created by adolfo reyes on 11/27/17.
//  Copyright © 2017 adolfo reyes. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    //Outlets
    @IBOutlet weak var userImg: CircleImage!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var timeStamplLbl: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(message: Message){
        messageBodyLbl.text = message.message
        userNameLbl.text = message.userName
        userImg.image = UIImage(named: message.userAvatar)
        userImg.backgroundColor = UserDataSerivce.instance.returnUIColor(components: message.userAvatarColor)
        guard var isoDate = message.timeStamp else { return }
        let end = isoDate.index(isoDate.endIndex, offsetBy: -5)
        isoDate = isoDate.substring(to: end)
        
        let isoFormatter = ISO8601DateFormatter()
        let chatDate = isoFormatter.date(from: isoDate.appending("Z"))
        
        let newFormatter = DateFormatter()
        newFormatter.date(from: "MMM d, h:mm a")
        
        if let finalDate = chatDate {
            let finalDate = newFormatter.string(from: finalDate)
            timeStamplLbl.text = finalDate
        }
        
    }
}
