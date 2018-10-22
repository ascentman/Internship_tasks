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

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Bundle.main.loadNibNamed(String(describing: AnimatedView.self), owner: self, options: nil)
        addSubview(contentContainerView)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .blue
        let backLayer = BackLayer()
        let cardLayer = CardLayer()
        layer.addSublayer(backLayer)
        layer.addSublayer(cardLayer)
    }
}
