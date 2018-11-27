//
//  AppDelegatesExt.swift
//  PushNotUsingFirebase
//
//  Created by SunarcMac on 19/11/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import Foundation
import UserNotifications
import Firebase

class AppDelegatesExt: AppDelegate  {
    

    }
    

    
    
    
    
    
    
    
    
    
    
//    //Called when Registration for Remote Notifications is successful
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        InstanceID.instanceID().instanceID { (result, error) in
//            if let error = error {
//                print("Error fetching remote instance ID: \(error)")
//            } else if let result = result {
//                print("Remote instance ID token: \(result.token)")
//            }
//        }
//    }
//    
//    //Called when Registration for Remote Notifications Fails
//    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
//        print("Registration failed!")
//    }
//    
//    var applicationStateString: String {
//        if UIApplication.shared.applicationState == .active {
//            return "active"
//        } else if UIApplication.shared.applicationState == .background {
//            return "background"
//        }else {
//            return "inactive"
//        }
//    }
//    
//
//    
//    
//    
//    
//    // iOS10+, called when presenting notification in foreground
//    //Called when Cloud Message Arrives While App is in Foreground
//    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//        //let userInfo = notification.request.content.userInfo
//        //        NSLog("[UserNotificationCenter] applicationState: \(applicationStateString) willPresentNotification: \(userInfo)")
//        //        //TODO: Handle foreground notification
//        //        completionHandler([.alert])
//        
//        
//        // custom code to handle push while app is in the foreground
//        print("Handle push from foreground \(notification.request.content.userInfo)")
//        
//        
//        // Reading message body
//        let dict = notification.request.content.userInfo["aps"] as! NSDictionary
//        
//        var messageBody:String?
//        var messageTitle:String = "Alert"
//        
//        if let alertDict = dict["alert"] as? Dictionary<String, String> {
//            messageBody = alertDict["body"]!
//            if alertDict["title"] != nil { messageTitle  = alertDict["title"]! }
//            
//        } else {
//            messageBody = dict["alert"] as? String
//        }
//        
//        print("Message body is \(messageBody!) ")
//        print("Message messageTitle is \(messageTitle) ")
//        // Let iOS to display message
//        completionHandler([.alert,.sound, .badge])
//        
//    }
//    
//    // iOS10+, called when received response (default open, dismiss or custom action) for a notification
//    //Called When Cloud Message is Received While App is in Background or is Closed
//    
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        let userInfo = response.notification.request.content.userInfo
//        NSLog("[UserNotificationCenter] applicationState: \(applicationStateString) didReceiveResponse: \(userInfo)")
//        //TODO: Handle background notification
//        completionHandler()
//    }
//    
//    
//    //Called When Firebase Cloud Messaging Token is Refreshed
//    func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
//        print("Token refreshed")
//    }
//    

