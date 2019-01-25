//
//  ViewController.swift
//  DeepLiking
//
//  Created by Anand Suthar on 19/01/19.
//  Copyright © 2019 Anand Suthar. All rights reserved.
//

import UIKit

enum ProfileType: String {
    case guest = "Guest" 
    case host = "Host"
}

enum DeeplikType{
    enum Messages{
        case root
        case details(id: String)
    }
    case message(Messages)
    case activity
    case newListing
    case request(id: String)
}







class ViewController: UIViewController {
   var currentProfile = ProfileType.guest
      let lbl = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
      configureFor(profileType: currentProfile)
         self.view.addSubview(lbl)
      updatedlbl()
    
    }

    func configureFor(profileType: ProfileType) {
        title = profileType.rawValue
    }
    
    func updatedlbl(){
       
        lbl.text = "sdfdasf add ho gya "
        lbl.frame = self.view.frame
        lbl.textAlignment = .center
        lbl.textColor = UIColor.blue
        //self.view.addSubview(lbl)
    }
    
//    func injected(){
//        updatedlbl()
//    }
//
    
    
    

}

extension ViewController {


    @objc func injected() {
        for subview in self.view.subviews {
         
            subview.backgroundColor = UIColor.brown
               updatedlbl()
            let view = UIView()
            view.backgroundColor = UIColor.black
            subview.addSubview(view)
           // lbl.text = "safsadf"

          //  subview.addSubview(lbl)

        }

        viewDidLoad() 
    }
  
}
