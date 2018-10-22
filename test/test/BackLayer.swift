//
//  BackLayer.swift
//  test
//
//  Created by Vova on 10/22/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

private enum OuterRectangle {
    case width
    case height
    
    func get() -> CGFloat {
        switch self {
        case .width:
            return UIScreen.main.bounds.width
        case .height:
            return UIScreen.main.bounds.height
        }
    }
}

private enum InnerRectangle {
    case width
    case height
    
    func get() -> CGFloat {
        switch self {
        case .width:
            return 300
        case .height:
            return 180
        }
    }
}

class BackLayer: CAShapeLayer {
    
    override init() {
        super.init()
        
        path = drawPath().cgPath
        fillRule = CAShapeLayerFillRule.evenOdd
        fillColor = UIColor.lightGray.cgColor
        opacity = 0.6
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawPath() -> UIBezierPath {
        let viewPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: OuterRectangle.width.get(), height: OuterRectangle.height.get()))
        let rectPath = UIBezierPath(rect: CGRect(x: OuterRectangle.width.get() / 2 - InnerRectangle.width.get() / 2,
                                                 y: OuterRectangle.height.get() / 2 - InnerRectangle.height.get() / 2,
                                                 width: InnerRectangle.width.get(), height: InnerRectangle.height.get()))
        viewPath.append(rectPath)
        viewPath.usesEvenOddFillRule = true
        return viewPath
    }
}
