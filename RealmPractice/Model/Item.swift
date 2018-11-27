//
//  Item.swift
//  RealmPractice
//
//  Created by Anand Suthar on 26/11/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import Foundation
import RealmSwift

class Item:Object{
    @objc dynamic var title:String?
    @objc dynamic var done:Bool = false
    @objc dynamic var dateCreated: Date?
    
    var parentcategory = LinkingObjects(fromType: Category.self, property: "items")
    override class func primaryKey() -> String? {
        return "title"
}
}
