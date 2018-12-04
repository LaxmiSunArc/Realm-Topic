//
//  ViewController.swift
//  NestedJSONRealm
//
//  Created by Anand Suthar on 03/12/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
let menu = Menu()
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.getMenuItems({
            print("get data")
        }) { (errormessage) in
            print(errormessage)
        }
    }


}

