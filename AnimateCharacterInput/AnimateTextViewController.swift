//
//  ViewController.swift
//  AnimateCharacterInput
//
//  Created by Vova on 9/4/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

final class AnimateTextViewController: UIViewController {
    
    @IBOutlet private weak var animatedLabel: SubClassLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animatedLabel.text = nil
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        animatedLabel.showAnimated(text: "HELLO! It's me!", withDelay: 3)
    }
}
