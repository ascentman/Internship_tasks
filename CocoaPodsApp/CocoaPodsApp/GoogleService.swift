//
//  GoogleService.swift
//  CocoaPodsApp
//
//  Created by Vova on 9/21/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit
import GoogleSignIn

final class GoogleService: NSObject {
    
    static let sharedInstance = GoogleService()
    var userData: [String: Any] = [:]
    fileprivate var presenter:UIViewController?
    
    @discardableResult func registerInApplication(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GIDSignIn.sharedInstance().clientID = "376576529530-ebng8phkau5phidnc4mnuioqetnqmp7j.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        return true
    }
    
    // MARK: - UserManagement
    
    func signOut() {
        GIDSignIn.sharedInstance().signOut()
    }
    
    func signIn() {
        GIDSignIn.sharedInstance().signIn()
    }
    
    func disconnectUser() {
        GIDSignIn.sharedInstance().disconnect()
    }
}

// MARK: - GIDSignInDelegate

extension GoogleService: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            userData["fullname"] = user.profile.name
            userData["email"] = user.profile.email
            userData["image"] = user.profile.imageURL(withDimension: 200)
        }
    }
}

// MARK: - GIDSignInUIDelegate

extension GoogleService: GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, present viewController: UIViewController!) {
        presenter?.present(viewController, animated: true, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, dismiss viewController: UIViewController!) {
        presenter = nil
        viewController.dismiss(animated: true, completion: nil)
    }
}
