//
//  UIViewController+Extensions.swift
//  RealmTest
//
//  Created by Vova on 1/23/19.
//  Copyright © 2019 Vova. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentAlertWithTextField(_ title: String,
                                   message : String,
                                   acceptTitle: String,
                                   declineTitle: String?,
                                   inputPlaceholder: String? = nil,
                                   okActionHandler:  ((_ text: String?) -> (Void))? = nil,
                                   cancelActionHandler:  (()->())? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = inputPlaceholder
        }
        
        let okAction = UIAlertAction(title: acceptTitle, style: .default) { _ in
            guard let textField = alertController.textFields?.first else {
                okActionHandler?(nil)
                return
            }
            okActionHandler?(textField.text)
        }
        alertController.addAction(okAction)
        
        if let declineTitle = declineTitle {
            let cancelAction = UIAlertAction(title: declineTitle, style: .cancel, handler: { _ in
                cancelActionHandler?()
            })
            alertController.addAction(cancelAction)
        }
        self.present(alertController, animated: true)
    }
}
