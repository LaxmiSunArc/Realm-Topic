//
//  RealmExt.swift
//  RealmPractice
//
//  Created by Anand Suthar on 26/11/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import Foundation
import RealmSwift

extension Object {
   
    func save() {
        try! DB.shared.realm.write {
            DB.shared.realm.add(self, update: true)
        }
    }
    
  
}
