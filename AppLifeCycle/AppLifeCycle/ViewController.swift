//
//  ViewController.swift
//  AppLifeCycle
//
//  Created by user on 9/30/18.
//  Copyright © 2018 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // called if we load viewController from nib or programatically (if nib: nil)
    init() {
        super.init(nibName: nil, bundle: nil)
        print("init ViewController called")
        view.backgroundColor = UIColor.green
    }
    
    // called if we use Storybords
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad called")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewDidDisappear(animated)
        print("viewDidDisappear called")
    }
    
    deinit {
        print("deinit called")
    }
    
    override func didReceiveMemoryWarning() {
        print("called when app uses too much RAM")
    }
}

/**

 One ViewController lifecycle exclusion:
 
In case of UITabBarController as rootViewController init() called after didload().
It's because super.init(nibName:bundle) calls loadView() during initialization which leads to viewDidLoad().
Other UIViewController subclasses do not instantiate their view during the initialization process.

 */

class TabBarViewController: UITabBarController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("init TabBarViewController called")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad called")
    }
}
