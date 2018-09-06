//
//  SubClassLabel.swift
//  AnimateCharacterInput
//
//  Created by Vova on 9/5/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

class SubClassLabel : UILabel {
    
    private let serialQueue = DispatchQueue(label: "myQueue")
    
    func showAnimated(text: String?, withDelay sec: TimeInterval) {
        let symbolsCount = text?.count
        let animationDuration = sec
        guard let count = symbolsCount else {
            return
        }
        let charAnimationInterval = animationDuration / TimeInterval(count)
        
        serialQueue.async {
            for char in text ?? "" {
                DispatchQueue.main.async {
                    self.text = (self.text ?? "") + String(char)
                }
                Thread.sleep(forTimeInterval: charAnimationInterval)
            }
        }
    }
}
