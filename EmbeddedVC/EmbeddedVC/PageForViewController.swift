//
//  PageForViewController.swift
//  EmbeddedVC
//
//  Created by Vova on 9/13/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

class PageForViewController {
    
    let viewController: UIViewController
    let index: Int
    
    var next: Int {
        get {
            return index + 1
        }
    }
    
    init?(for index: Int) {
        
        guard let carArray = CarPagesViewController.loadCarsFromPlist() else {
            return nil
        }
        if index < 0 || index > carArray.count - 1 {
            return nil
        }
        
        if let carViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "car") as? CarViewController {
            carViewController.loadViewIfNeeded()
            
            let carAtIndex = carArray[index]
            guard let carImage = UIImage(named: carAtIndex) else {
                return nil
            }
            let carObject = Car(image: carImage, name: carAtIndex)
            
            carViewController.updateWithCarObject(carObject)
            
            viewController = carViewController
            self.index = index
        } else {
            return nil
        }
    }
}
