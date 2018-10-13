//
//  AppDelegate.swift
//  AppLifeCycle
//
//  Created by user on 9/30/18.
//  Copyright © 2018 user. All rights reserved.
//

/**

 Result in console:
 
 - starting the app
 applicationWillFinishLaunchingWithOptions called
 applicationDidFinishLaunchingWithOptions called
 applicationDidBecomeActive called
 
 - pressing Home button twice
 applicationWillResignActive called
 
 - pressing Home button again (Springboard is shown)
 applicationDidEnterBackground called
 
 - calling the app from background
 applicationWillEnterForeground called
 applicationDidBecomeActive called
 
 - releasing app from the memory
 applicationWillResignActive called
 applicationDidEnterBackground called
 applicationWillTerminate called
*/

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("applicationWillFinishLaunchingWithOptions called")
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("applicationDidFinishLaunchingWithOptions called")
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
//        window?.rootViewController = TabBarViewController()
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("applicationWillResignActive called")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("applicationDidEnterBackground called")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("applicationWillEnterForeground called")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("applicationDidBecomeActive called")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("applicationWillTerminate called")
    }
}
