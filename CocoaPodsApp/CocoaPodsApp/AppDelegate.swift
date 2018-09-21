//
//  AppDelegate.swift
//  CocoaPodsApp
//
//  Created by Vova on 9/20/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GoogleService.sharedInstance.registerInApplication(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
}
