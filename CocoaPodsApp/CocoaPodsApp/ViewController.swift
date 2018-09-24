//
//  ViewController.swift
//  CocoaPodsApp
//
//  Created by Vova on 9/20/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit
import GoogleSignIn
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var hello: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBAction func didTapSignIn(_ sender: Any) {
        GoogleService.sharedInstance.signIn(self) { [weak self] (userObj, error) in
            DispatchQueue.main.async {
                if let fullname = userObj?.fullname,
                    let email = userObj?.email {
                    self?.hello.text = "Привіт, \(fullname), \(email)"
                }
                DispatchQueue.main.async {
                    if let imageUrl = userObj?.imageURL {
                        Alamofire.request(imageUrl).response(completionHandler: { (response) in
                            assert(response.error == nil, "can't download image")
                            if let data = response.data {
                                self?.logoImageView.image = UIImage(data: data)
                            }
                        })
                    }
                }
            }
        }
    }
    
    @IBAction func didTapSignOut(_ sender: AnyObject) {
        
        hello.text = "Signed out"
        logoImageView.image = UIImage(named: "cat")
        GoogleService.sharedInstance.signOut()
    }
}
