//
//  CarViewController.swift
//  EmbeddedVC
//
//  Created by Vova on 9/11/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {

    @IBOutlet private weak var carImageView: UIImageView!
    @IBOutlet private weak var carName: UILabel!
    
    func updateWithCarObject(_ carObj: Car) {
        carImageView.image = carObj.image
        carName.text = carObj.name
    }
}
