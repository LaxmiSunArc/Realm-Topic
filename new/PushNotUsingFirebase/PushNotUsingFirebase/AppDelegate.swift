//
//  AppDelegate.swift
//  PushNotUsingFirebase
//
//  Created by SunarcMac on 14/11/18.
//  Copyright © 2018 SunarcMac. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {
    
    var window: UIWindow?
    static var shared: AppDelegate { return UIApplication.shared.delegate as! AppDelegate }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.registerForPushNotifications()
        
        return true
    }
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            print("Permission granted: \(granted)")
            guard granted else { return }
            self.getNotificationSettings()
        }
    }
    
    func getNotificationSettings() {
        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
            print("Notification settings: \(settings)")
            guard settings.authorizationStatus == .authorized else { return }
            UIApplication.shared.registerForRemoteNotifications()
        }
    
        func application(_ application: UIApplication,
                         didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
            let tokenParts = deviceToken.map { data -> String in
                return String(format: "%02.2hhx", data)
                
            }
            
            let token = tokenParts.joined()
            print("Device Token: \(token)")
            
        
        }
        
        func application(_ application: UIApplication,
                         didFailToRegisterForRemoteNotificationsWithError error: Error) {
            print("Failed to register: \(error)")
        }

    }
}
//    func registerForPushNotifications() {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
//            (granted, error) in
//            print("Permission granted: \(granted)")
//            guard granted else { return }
//            self.getNotificationSettings()
//        }
//    }
//    
//    func getNotificationSettings() {
//        UNUserNotificationCenter.current().getNotificationSettings { (settings) in
//            print("Notification settings: \(settings)")
//            guard settings.authorizationStatus == .authorized else { return }
//            UIApplication.shared.registerForRemoteNotifications()
//        }
//    }
//    
//    func application(_ application: UIApplication,
//                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        let tokenParts = deviceToken.map { data -> String in
//            return String(format: "%02.2hhx", data)
//        }
//        
//        let token = tokenParts.joined()
//        print("Device Token: \(token)")
//    }
//    
//    func application(_ application: UIApplication,
//                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
//        print("Failed to register: \(error)")
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
//    func requestNotificationAuthorization(application: UIApplication) {
//        if #available(iOS 11.0, *) {
//            UNUserNotificationCenter.current().delegate = self
//            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//            UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: {granted, error in
//                print("sucess: \(granted)")
//                if let error = error {
//                    print(error.localizedDescription)
//                }
//            })
//        }
//    }


//@available(iOS 11, *)
//extension AppDelegate : UNUserNotificationCenterDelegate {
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
//}

//extension AppDelegate : MessagingDelegate {
//    //Called When Firebase Cloud Messaging Token is Refreshed
//    func messaging(_ messaging: Messaging, didRefreshRegistrationToken fcmToken: String) {
//        print("Token refreshed")
//    }
//}

