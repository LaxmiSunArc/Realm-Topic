//
//  AppDelegate.swift
//  PaytmIOS
//
//  Created by Anand Suthar on 16/01/19.
//  Copyright © 2019 Anand Suthar. All rights reserved.
//

import UIKit

class CustomMessageCell: UITableViewCell {


    @IBOutlet var messageBackground: UIView!
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var messageBody: UILabel!
    @IBOutlet var senderUsername: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        messageBody.tintColor = UIColor.black
        
    }


}

