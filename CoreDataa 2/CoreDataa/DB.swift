//
//  DBManager.swift
//  RealmExample
//
//  Created by SunarcMAC on 26/03/18.
//  Copyright © 2018 SunarcMAC. All rights reserved.
//

import Foundation
import RealmSwift

class DB {
    
    var realm: Realm
    
    static let shared = DB()
    
    
    private init() {
        realm = try! Realm()
    }
    
}




