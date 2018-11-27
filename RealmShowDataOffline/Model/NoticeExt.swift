//
//  NoticeExt.swift
//  RealmDemo
//
//  Created by Anand Suthar on 19/11/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import Foundation
import RealmSwift
import Alamofire


class MyNotice: Notice {
    

    func getNotice(Success:@escaping (_ noticeArrs:[Notice])->Void, failur:@escaping (_ errorMessage: String,_ array:[Notice])->Void) {
        
   
        var params = [String:Any]()
        params["filter"] = "nearby"
        params["page"] = 1
        params["storeId"] = 1
       
             var noticeArrs = [Notice]()
            HTTP().connectionWithRequestObject(api: API.MY_NOTICE, parameters: params, method: .post, indicator: true, success: { (Result) in
                print(Result)
                let resultArr = Result as? [[String:Any]]
                if resultArr?.count ?? 0 > 0 {
                    if  let resultDict = resultArr!.first?["data"] as? [[String:Any]]{
                        print(resultDict)
                            for allData in resultDict {
                            let notice = MyNotice()
                            notice.initWithJSON(JSON: allData)
                            notice.save()
                            
                        }
                    }
                }
               
                self.getNoticeFromRealm(success: { (noticeArr) in
                    noticeArrs = noticeArr
                })
                Success(noticeArrs)
            }) { (errormessage) in
                self.getNoticeFromRealm(success: { (noticeArr) in
                    print("data fails")
                    noticeArrs = noticeArr
                })
                print(errormessage)
                failur(errormessage,noticeArrs)
            }
         
        
    }
    
 
}
extension MyNotice {
    func getNoticeFromRealm(success:(_ noticeArr:[Notice])->Void)-> Void {
         let notice = MyNotice()
         var noticeArr = [Notice]()
         let realmObjects: Results<MyNotice> = DB.shared.realm.objects(MyNotice.self)
         noticeArr = realmObjects.Array(ofType: MyNotice.self)
        success(noticeArr)
    }
}


