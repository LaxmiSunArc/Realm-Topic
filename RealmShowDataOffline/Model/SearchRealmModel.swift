//
//  SearchRealmModel.swift
//  RealmDemo
//
//  Created by Anand Suthar on 20/11/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import Foundation
import RealmSwift

class SearchData:Object{
    
    @objc dynamic var searchData:String!
    
    override static func primaryKey() -> String?{
        return "searchData"
    }
    
    
    
}
