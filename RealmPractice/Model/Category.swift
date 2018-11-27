//
//  Category.swift
//  RealmPractice
//
//  Created by Anand Suthar on 26/11/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import Foundation
import RealmSwift

class Category:Object{
    
    @objc dynamic var name: String?
    @objc dynamic var colour: String?
    let items = List<Item>()
    
    override class func primaryKey() -> String? {
        return "name"
   }
}
