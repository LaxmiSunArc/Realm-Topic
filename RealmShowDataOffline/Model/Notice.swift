//
//  Notice.swift
//  RealmDemo
//
//  Created by Anand Suthar on 19/11/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import Foundation
import RealmSwift

 class Notice:Object{
    
   @objc dynamic var title:String?
   @objc dynamic var id:String?
   @objc dynamic var categoryId:String?
   @objc dynamic var createdAt:String?
   @objc dynamic var content:String?
   @objc dynamic var metaKeywords:String?
   @objc dynamic var merchentName:String?
   @objc dynamic var merchentId:String?
   @objc dynamic var image:String?
   @objc dynamic var categoryName:String?
   @objc dynamic var isLikedByMe: Bool = false
    
   

    override static func primaryKey() -> String?{
        return "id"
    }
    
  func initWithJSON(JSON: Any){
    
        let jsonResult = JSON as? [String: Any]
    
        self.title          = jsonResult?["title"] as? String
        self.id             = jsonResult?["id"] as? String
        self.categoryId     = jsonResult?["category_id"] as? String
        self.content        = jsonResult?["content"] as? String
        self.metaKeywords   = jsonResult?["metakeywords"] as? String
        self.merchentId     = jsonResult?["merchant_id"] as? String
        self.merchentName   = jsonResult?["merchant_name"] as? String
        self.image          = jsonResult?["image"] as? String
        self.categoryName   = jsonResult?["category_name"] as? String
        self.isLikedByMe    = ((jsonResult?["is_like"] as? String) != nil)
    
        }
        
   
}
