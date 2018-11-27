//
//  AppDelegate.swift
//  RealmTasks
//
//  Created by Anand Suthar on 27/11/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import UIKit
import RealmSwift

let uiRealm = try! Realm()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }
}
