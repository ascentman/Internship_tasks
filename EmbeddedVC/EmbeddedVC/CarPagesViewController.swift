//
//  CarPagesViewController.swift
//  EmbeddedVC
//
//  Created by Vova on 9/11/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

final class CarPagesViewController: UIPageViewController {

    private var currentIndex: Int = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        if let firstViewController = viewPageFor(0)?.viewController {
            setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
        }
    }
    
    func viewPageFor(_ index: Int) -> PageForViewController? {
        return PageForViewController(for: index)
    }
    
    class func loadCarsFromPlist() -> [String]? {
        if let path = Bundle.main.path(forResource: "Cars", ofType: "plist"),
            let rawArray = NSArray(contentsOfFile: path) as? [String] {
            return rawArray
        }
        return nil
    }
}

// MARK: UIPageViewControllerDelegate & UIPageViewControllerDataSource

extension CarPagesViewController : UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard  let viewControllerBefore = viewPageFor(currentIndex - 1)?.viewController else {
            return nil
        }
        currentIndex -= 1
        return viewControllerBefore
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let count = CarPagesViewController.loadCarsFromPlist()?.count {
            if currentIndex < count {
                guard  let viewControllerBefore = viewPageFor(currentIndex + 1)?.viewController else {
                    return nil
                }
                currentIndex += 1
                return viewControllerBefore
            }
        }
        return nil
    }

    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        if let count = CarPagesViewController.loadCarsFromPlist()?.count {
            return count
        }
        return 0
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
