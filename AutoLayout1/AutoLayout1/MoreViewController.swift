//
//  MoreViewController.swift
//  AutoLayout1
//
//  Created by Vova on 9/19/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    @IBOutlet private weak var sideMenuConstraint: NSLayoutConstraint!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.sideMenuConstraint.constant = 100
        self.view.layoutIfNeeded()
        show()
    }
    
    func show() {
        UIView.animate(withDuration: 1) {
            self.sideMenuConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}
