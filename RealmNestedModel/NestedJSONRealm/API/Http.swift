//
//  Http.swift
//  NestedJSONRealm
//
//  Created by Anand Suthar on 03/12/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import Foundation
import Alamofire

class HTTP: NSObject {
    
    
    func connection(api: String, parameters: Any?, method: HTTPMethod, indicator: Bool, success: @escaping (_ message: Any) -> (), failure: @escaping (_ errorMessage: String) -> ()) -> Void {
        
        
        
        let randomTag = arc4random()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        if indicator == true {
          //  showIndicator(tag: Int(randomTag))
        }
        
        let apiPrefix = "https://punjabstore.co.in/magento2.2/"
        
        var request = URLRequest(url: URL(string: apiPrefix + api)!)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 20
        let bearer = "mbj49kypyenotv7nvl4ujdsux9qc6pb9"
        if bearer.count != 0 {
            request.setValue("Bearer \(bearer)", forHTTPHeaderField: "Authorization" )
            request.setValue("\(89)", forHTTPHeaderField: "customerId" )
        }
        
        print(apiPrefix + api)
        print(parameters)
        print(method)
        print(request.allHTTPHeaderFields)
        
        if parameters != nil {
            request.httpBody = try! JSONSerialization.data(withJSONObject: parameters!)
            let json = try! JSONSerialization.data(withJSONObject: parameters!)
            let jsonString = String(bytes: json, encoding: .utf8)
            print(jsonString!)
        }
        
        
        
        
        
        
        Alamofire.request(request).responseJSON { response in
            
          //  self.hideIndicator(tag: Int(randomTag))
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            if response.response == nil {
                failure("No network found")
            }
            
            if response.response?.statusCode == 200{
                if response.result.value != nil {
                    success(response.result.value!)
                }else{
                    failure("Server not responding")
                }
            } else {
                if let result = response.result.value{
                    if let json = result as? [String: Any] {
                        
                        guard let message = json["message"] as? String else{
                            failure("Unknown error found")
                            return
                        }
                        failure(message)
                    }
                }else {
                    failure("Unknown error found")
                }
            }
            
        }
        
    }
    
    
}
