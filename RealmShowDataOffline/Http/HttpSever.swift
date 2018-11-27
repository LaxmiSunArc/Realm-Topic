//
//  HttpSever.swift
//  RealmDemo
//
//  Created by Anand Suthar on 19/11/18.
//  Copyright © 2018 Anand Suthar. All rights reserved.
//

import Foundation
import Alamofire



class HTTP:NSObject {
    
    private func connectWithRequestObject(api: String, parameters: Any?, method: HTTPMethod, contentType: String, indicator: Bool, success: @escaping (_ message: Any) -> (), failure: @escaping (_ errorMessage: String) -> ()) -> Void {
        
       
        var request = URLRequest(url: URL(string: API.API_PREFIX + api)!)
        request.httpMethod = method.rawValue
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 20
        request.setValue("Bearer 18w03c42tv8iwudg60701crwm3jm41ok", forHTTPHeaderField: "Authorization" )
        
        if parameters != nil {
            
            request.httpBody = try! JSONSerialization.data(withJSONObject: parameters!)
            print(parameters ?? "")
           
        }
        
        print(API.API_PREFIX + api)
        print(method)
        print(parameters ?? "Parameter not available")
        print(request.allHTTPHeaderFields)
      
        Alamofire.request(request).responseJSON { response in
           
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            print(response)
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
    
    func connectionWithRequestObject(api: String, parameters: Any?, method: HTTPMethod, indicator: Bool, success: @escaping (_ message: Any) -> (), failure: @escaping (_ errorMessage: String) -> ()) -> Void {
        self.connectWithRequestObject(api: api, parameters: parameters, method: method, contentType: "application/json", indicator: indicator, success: success, failure: failure)
    }
    
    
    
    
    
}
