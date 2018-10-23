//
//  Animations.swift
//  test
//
//  Created by user on 10/22/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

class Animations {
    static let shared = Animations()
    private init() {}
    
    func horizontalMovement(on layer: CALayer, from: CGPoint, to: CGPoint) -> CAAnimation {
        let cardAnimation = CABasicAnimation()
        cardAnimation.fromValue = from
        cardAnimation.toValue = to
        cardAnimation.duration = 4.0
        return cardAnimation
    }
    
    func appearence(on layer: CALayer, from: CGFloat, to: CGFloat) -> CAAnimation {
        let checkAnimation = CABasicAnimation()
        checkAnimation.fromValue = from
        checkAnimation.toValue = to
        checkAnimation.duration = 1.0
        return checkAnimation
    }
    
}
