//
//  RealmExt.swift
//  RealmDemo
//
//  Created by Anand Suthar on 19/11/18.
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
    
    func delete() {
        try! DB.shared.realm.write {
            DB.shared.realm.delete(self)
        }
    }
    
    
}



extension Realm {
    
    class func deleteAll<Element: Object>(_ type: Element.Type) {
        try! DB.shared.realm.write {
            DB.shared.realm.delete(DB.shared.realm.objects(type))
        }
    }
    
}


extension Results {
    func Array<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        
        return array
    }
}


extension List {
    func add(object: Element) {
        try! DB.shared.realm.write {
            _rlmArray.add(object as AnyObject)
        }
    }
}

