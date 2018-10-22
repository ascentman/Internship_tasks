//
//  CardLayer.swift
//  test
//
//  Created by Vova on 10/22/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

private enum Frame {
    case x
    case y
    case startYPosition
    
    func get() -> CGFloat {
        switch self {
        case .x:
            return 50
        case .y:
            return 50
        case .startYPosition:
            return UIScreen.main.bounds.maxY + 100
        }
    }
}

class CardLayer: CALayer {
    
    init(inFrame: CGRect) {
        super.init()
        contents = CALayer().setImage(named: "card")?.cgImage
        contentsGravity = CALayerContentsGravity.resizeAspect
        frame = CGRect(x: 0, y: 0, width: Frame.x.get(), height: Frame.y.get())
        position = CGPoint(x: inFrame.midX, y: Frame.startYPosition.get())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCardAnimation(from: CGPoint, to: CGPoint) {
        let cardAnimation = Animations.shared.horizontalMovement(on: self, from: from, to: to)
        self.add(cardAnimation, forKey: "position")
    }
}
