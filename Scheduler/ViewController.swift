//
//  ViewController.swift
//  Scheduler
//
//  Created by Vova on 9/3/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var nsInvocationButton: UIButton!
    @IBOutlet weak var nsOperationButton: UIButton!
    
    private var queue = OperationQueue()
    private var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nsInvocationClicked(_ sender: Any) {
        
        // As NSInvocationOperation was removed in iOS 8.1 SDK I add operation using block
        let operation1 = BlockOperation {
            for i in 0...500000 {
                print("NSOperation1:", i)
            }
        }
        operation1.addObserver(self, forKeyPath:"isFinished", options:.new, context:nil)
        queue.addOperation(operation1)
    }
    
    @IBAction func nsOperationClicked(_ sender: Any) {
        
        let operation2 = BlockOperation {
            for i in 0...100000 {
                print("NSOperation2:", i)
            }
        }
        operation2.addObserver(self, forKeyPath:"isFinished", options:.new, context:nil)
        queue.addOperation(operation2)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if let op = object as? Operation, let keyPath = keyPath {
            op.removeObserver(self, forKeyPath: keyPath)
        }
        counter += 1
        DispatchQueue.main.async {
            self.counterLabel.text = String(self.counter)
        }
    }
}
