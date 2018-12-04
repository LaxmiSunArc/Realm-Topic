//
//  DB.swift
//  NestedJSONRealm
//
//  Created by Anand Suthar on 03/12/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import Foundation
import RealmSwift

class DB{
    
    var realm:Realm
    static let shared = DB()
    
    private init() {
        realm = try! Realm()
    }
    
    
}
