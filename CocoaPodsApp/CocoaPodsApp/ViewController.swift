//
//  ViewController.swift
//  CocoaPodsApp
//
//  Created by Vova on 9/20/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {

    
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var hello: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapSignIn(_ sender: Any) {
        GoogleService.sharedInstance.signIn()
        if let name = GoogleService.sharedInstance.userData["fullname"] as? String,
            let email = GoogleService.sharedInstance.userData["email"] as? String {
            hello.text = "Привіт, \(String(describing: name)), \(String(describing: email))"
        }
        self.loadViewIfNeeded()
    }
    
    @IBAction func didTapSignOut(_ sender: AnyObject) {
        
        hello.text = "signed out"
        GoogleService.sharedInstance.userData = [:]
        logoImageView.image = nil
        GoogleService.sharedInstance.signOut()
    }
}

extension UIImage {
    convenience init?(withContentsOfUrl url: URL) throws {
        let imageData = try Data(contentsOf: url)
        self.init(data: imageData)
    }
}
