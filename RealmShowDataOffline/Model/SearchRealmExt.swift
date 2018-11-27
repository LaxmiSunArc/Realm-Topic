//
//  SearchRealmExt.swift
//  RealmDemo
//
//  Created by Anand Suthar on 21/11/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import Foundation
import RealmSwift

class SearchRealm {

class func getSearchNotices(_ searchKey: String, success: @escaping (_ searchNoticeList:[Notice]) -> Void, failur: @escaping (_ errorMessage: String) -> Void){
   
    
    HTTP().connectionWithRequestObject(api:API.SEARCH_NOTIC  + searchKey + "?page=1", parameters: nil, method: .get, indicator: false, success: { (result) in
        var searchNoticeList = [Notice]()
        let outerArray = result as! [[String: Any]]
        if outerArray.count > 0 {
            let noticeJSONArray = outerArray[0]["data"] as! [[String: Any]]
            //Realm.deleteAll(SearchData.self)
            for noticeJSON in noticeJSONArray {
                
                let notice = Notice()
                notice.initWithJSON(JSON: noticeJSON)
                searchNoticeList.append(notice)
               // self.searchNoticeList.append(notice)
            }
        }
        success(searchNoticeList)
    }) { (errorMessage) in
        failur(errorMessage)
    }
 
    
}
}
