//
//  PhoneLayer.swift
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
            return 120
        case .y:
            return 120
        case .topMargin:
            return 150
        }
    }
}

class PhoneLayer: CALayer {
    
    init(inFrame: CGRect) {
        super.init()
        contents = CALayer().setImage(named: "phone")?.cgImage
        contentsGravity = CALayerContentsGravity.resizeAspect
        frame = CGRect(x: 0, y: 0, width: Frame.x.get(), height: Frame.y.get())
        position = CGPoint(x: inFrame.midX, y: Frame.topMargin.get())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
