//
//  CardLayer.swift
//  test
//
//  Created by Vova on 10/22/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

private enum OuterRectangle {
    case width
    case height
    case midX
    case midY
    
    func get() -> CGFloat {
        switch self {
        case .width:
            return UIScreen.main.bounds.width
        case .height:
            return UIScreen.main.bounds.height
        case .midX:
            return UIScreen.main.bounds.midX
        case .midY:
            return UIScreen.main.bounds.midY
        }
    }
}


class CardLayer: CALayer {
    
    override init() {
        super.init()
        
        contents = setImage(named: "card")?.cgImage
        contentsGravity = CALayerContentsGravity.resizeAspect
        frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        position = CGPoint(x: OuterRectangle.midX.get(), y: OuterRectangle.midY.get())
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setImage(named: String) -> UIImage? {
        return UIImage(named: named)?.maskWithColor(color: UIColor.orange)
    }
}



//

extension UIImage {
    
    func maskWithColor(color: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        let rect = CGRect(origin: CGPoint.zero, size: size)
        
        color.setFill()
        self.draw(in: rect)
        
        context.setBlendMode(.sourceIn)
        context.fill(rect)
        
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resultImage
    }
    
    func image(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

