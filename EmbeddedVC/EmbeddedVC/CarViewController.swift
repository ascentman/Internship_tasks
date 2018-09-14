//
//  CarViewController.swift
//  EmbeddedVC
//
//  Created by Vova on 9/11/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

final class CarViewController: UIViewController {

    @IBOutlet private weak var carImageView: UIImageView!
    @IBOutlet private weak var carName: UILabel!
    
    var imageFileName: String!
    var pageIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customizePageControl()
        carImageView.image = UIImage(named: imageFileName)
        carName.text = imageFileName
    }
    
    private func customizePageControl() {
        let customPageControl = UIPageControl.appearance()
        customPageControl.currentPageIndicatorTintColor = UIColor.orange
        customPageControl.pageIndicatorTintColor = UIColor.lightGray
        customPageControl.backgroundColor = UIColor.white
    }
}
