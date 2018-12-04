//
//  MenuExt.swift
//  NestedJSONRealm
//
//  Created by Anand Suthar on 03/12/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import Foundation
import RealmSwift

extension Menu {

 
func getMenuItems(_ success: @escaping () -> Void, failur: @escaping (_ errorMessage: String) -> Void) {
    
    let api = "rest/V1/categories"
    HTTP().connection(api: api, parameters: nil, method: .get, indicator: false, success: { (result) in
        print(result)
        self.initWithJSON(json: result)
        self.save()
       
//        let response = result as! [String:Any]
//        if  let rawchileddata = response["children_data"] as? [[String:Any]]{
//            print(rawchileddata)
//            for rawChildrenData in rawchileddata {
//                self.initWithJSON(json: rawChildrenData)
//               self.save()
//            }
//        }
        
        success()
    }) { (errorMessage) in
        failur(errorMessage)
    }
    
}
    
}
