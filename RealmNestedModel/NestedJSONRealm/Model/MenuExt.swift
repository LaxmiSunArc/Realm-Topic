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

 
func getMenuItems(_ success: @escaping (_ menus:[Menu]) -> Void, failur: @escaping (_ errorMessage: String,_ menus:[Menu]) -> Void) {
    var menus = [Menu]()
    let api = "rest/V1/categories"
    HTTP().connection(api: api, parameters: nil, method: .get, indicator: false, success: { (result) in
        print(result)
        self.initWithJSON(json: result)
        self.save()
        self.getData(success: { (menu) in
            
           menus = menu
        }, failer: {
            print("errromessage")
        })
//        let response = result as! [String:Any]
//        if  let rawchileddata = response["children_data"] as? [[String:Any]]{
//            print(rawchileddata)
//            for rawChildrenData in rawchileddata {
//                self.initWithJSON(json: rawChildrenData)
//               self.save()
//            }
//        }
        
        success(menus)
    }) { (errorMessage) in
       
        self.getData(success: { (menu) in
            
            menus = menu
        }, failer: {
            print("errromessage")
        })
         failur(errorMessage,menus)
    }
    
}
  
}

extension Menu {
    
    func getData(success:(_ menus:[Menu])-> Void,failer:()-> Void){
        var menuDatas = [Menu]()
        
//        for childrenMenu in self.rawChildrenDatas{
//            if childrenMenu.isActive == true{
//            menuDatas.append(childrenMenu)
//                //self.getNearByNoticeFromDB()
//            }
//    }
        
        let objects: Results<Menu> = DB.shared.realm.objects(Menu.self).filter("ANY Menu CONTAINS rawChildrenDatas = List<Menu> ")
        menuDatas = objects.toArray(ofType:Menu.self)
//
//        for childrenMenu in objects{
//            if childrenMenu.isActive == true{
//                menuDatas.append(childrenMenu)
//                //self.getNearByNoticeFromDB()
//            }
//        }
        success(menuDatas)
    }
}
