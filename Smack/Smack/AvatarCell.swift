//
//  AvatarCell.swift
//  Smack
//
//  Created by adolfo reyes on 11/18/17.
//  Copyright © 2017 adolfo reyes. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpVIew()
    }
    
    
    func setUpVIew(){
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    } 
}
