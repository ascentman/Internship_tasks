//
//  AnimatedView.swift
//  test
//
//  Created by Vova on 10/22/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

class AnimatedView: UIView {
    
    @IBOutlet private weak var contentContainerView: UIView!

    var animatedView: UIView?
    private var backLayer: BackLayer?
    private var cardLayer: CardLayer?
    private var phoneLayer: PhoneLayer?
    private var checkLayer: CheckLayer?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed(String(describing: AnimatedView.self), owner: self, options: nil)
        addSubview(contentContainerView)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        frame = UIScreen.main.bounds
        backgroundColor = .blue
        
        backLayer = BackLayer(inFrame: frame)
        cardLayer = CardLayer(inFrame: frame)
        phoneLayer = PhoneLayer(inFrame: frame)
        checkLayer = CheckLayer(inFrame: frame)
        
        guard let backLayer = backLayer,
            let cardLayer = cardLayer,
            let phoneLayer = phoneLayer,
            let checkLayer = checkLayer else {
                return
        }
        animateCardLayer { _ in
            self.animateCheckLayer()
        }

        layer.addSublayer(backLayer)
        layer.addSublayer(cardLayer)
        layer.addSublayer(phoneLayer)
        layer.addSublayer(checkLayer)
    }

    private func animateCardLayer(_ completion: ((Bool) -> ())?) {
        let toPoint = CGPoint(x: bounds.midX, y: 150)
        let fromPoint = CGPoint(x: bounds.maxX, y: 150)
        cardLayer?.animateLayer(from: fromPoint, to: toPoint) { isFinished in
            completion?(isFinished)
        }
    }

    private func animateCheckLayer() {
        checkLayer?.animateLayer(from: 0.0, to: 1.0, with: { _ in
            self.animateCardLayer({ _ in
                self.animateCheckLayer()
            })
        })
    }
}
