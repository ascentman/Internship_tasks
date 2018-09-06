//
//  AppDelegate.swift
//  PhoneBook3
//
//  Created by Vova on 8/28/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Theme.current.apply()
        let manager = FileManagerClass()
        try? manager.createContactDirectory()
        try? manager.createImagesDirectory()
        return true
    }
}

