//
//  CheckLayer.swift
//  test
//
//  Created by user on 10/23/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

private enum Frame {
    case x
    case y
    case topMargin
    
    func get() -> CGFloat {
        switch self {
        case .x:
            return 30
        case .y:
            return 30
        case .topMargin:
            return 150
        }
    }
}

class CheckLayer: CALayer {
    
    init(inFrame: CGRect) {
        super.init()
        contents = CALayer().setImage(named: "check")?.cgImage
        contentsGravity = CALayerContentsGravity.resizeAspect
        frame = CGRect(x: 0, y: 0, width: Frame.x.get(), height: Frame.y.get())
        position = CGPoint(x: inFrame.midX, y: Frame.topMargin.get())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addCheckAnimation(from: CGFloat, to: CGFloat) {
        let checkAnimation = Animations.shared.appearence(on: self, from: from, to: to)
        self.add(checkAnimation, forKey: "opacity")
    }
}
