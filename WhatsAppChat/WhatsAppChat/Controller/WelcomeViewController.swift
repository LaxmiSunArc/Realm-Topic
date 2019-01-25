//
//  AppDelegate.swift
//  PaytmIOS
//
//  Created by Anand Suthar on 16/01/19.
//  Copyright © 2019 Anand Suthar. All rights reserved.
//

import UIKit
import Firebase


class WelcomeViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //If there is a logged in user, by pass this screen and go straight to ChatViewController
        
        if Auth.auth().currentUser != nil {
            performSegue(withIdentifier: "goToChat", sender: self)
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
