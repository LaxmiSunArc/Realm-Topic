//
//  ViewController.swift
//  SIRI
//
//  Created by Anand Suthar on 24/12/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myOderLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnPlaceOrder(_ sender: Any) {
        print("Print my Order")
        
        let activity  =  NSUserActivity.init(activityType: "sunarc.SIRI")
        activity.title = "Le lo  Order"
        activity.isEligibleForSearch = true
        activity.isEligibleForPrediction = true
        self.userActivity = activity
        self.userActivity?.becomeCurrent()
        
        
    }
    
}

