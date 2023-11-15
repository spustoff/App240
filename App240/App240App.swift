//
//  App240App.swift
//  App240
//
//  Created by IGOR on 07/11/2023.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Alamofire
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_4n1Eoty1DCkvPA64M4abRtvdG1UYPD")
        
        notificationsGetStarted()
        
        OneSignal.initialize("b58dc6c5-b858-41f7-8c04-7a1f6c16a974", withLaunchOptions: launchOptions)
        Amplitude.instance().initializeApiKey("907bd31e0bcfd8334658ecaff90aea22")
        
        Amplitude.instance().defaultTracking.sessions = true
        Amplitude.instance().setUserId(Apphud.userID())
        OneSignal.login(Apphud.userID())
        
        FirebaseApp.configure()
        
        return true
    }
}

func notificationsGetStarted() {
    
    let url = "https://onesignal-ba.com/api/os/kRv82z5K9icBjU6mDyi4/\(Apphud.userID())"
    
    let request = AF.request(url, method: .get)
    
    request.response { response in
                       
        switch response.result {
            
        case .success(_):
            
            print("ok")
            
        case .failure(_):
            
            print("failure")
        }
    }
}

@main
struct App240App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {

                ContentView()
            })
        }
    }
}
