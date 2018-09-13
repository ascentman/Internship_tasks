//
//  CarClass.swift
//  EmbeddedVC
//
//  Created by Vova on 9/11/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

class Car {
    
    var image: UIImage
    var name: String

    init(image: UIImage, name: String) {
        self.name = name
        self.image = image
    }
}
