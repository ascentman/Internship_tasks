//
//  CALayer+Extensions.swift
//  test
//
//  Created by user on 10/23/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

extension CALayer {
    func setImage(named: String) -> UIImage? {
        return UIImage(named: named)?.maskWithColor(color: UIColor.orange)
    }
}
