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
    fileprivate var presenter: UIViewController?
    fileprivate var singInCompletion: ((_ user: User?, _ error: Error?) -> ())?
    fileprivate var disconnectCompletion: ((_ success: Bool, _ error:Error?)->())?
    
    @discardableResult func registerInApplication(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if let url = Bundle.main.url(forResource:"GoogleService-Info", withExtension: "plist") {
            do {
                let data = try Data(contentsOf:url)
                let googlePlist = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [String:Any]
                GIDSignIn.sharedInstance().clientID = googlePlist?["CLIENT_ID"] as? String
            } catch {
                print("can't get CLIENT_ID")
            }
        }
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        return true
    }
    
    // MARK: - UserManagement
    
    func signOut() {
        GIDSignIn.sharedInstance().signOut()
    }
    
    func signIn(_ controller:UIViewController, completion: ((_ user: User?, _ error: Error?) -> ())?) {
        singInCompletion = completion
        presenter = controller
        GIDSignIn.sharedInstance().signIn()
    }
    
    func disconnectUser(completion:((_ success: Bool, _ error:Error?)->())? = nil) {
        disconnectCompletion = completion
        GIDSignIn.sharedInstance().disconnect()
    }
}

// MARK: - GIDSignInDelegate

extension GoogleService: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        let googleUserObj = User(fullname: user.profile.name, email: user.profile.email, imageURL: user.profile.imageURL(withDimension: 200))
        singInCompletion?(googleUserObj, error)
    }
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        disconnectCompletion?(error == nil, error)
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
