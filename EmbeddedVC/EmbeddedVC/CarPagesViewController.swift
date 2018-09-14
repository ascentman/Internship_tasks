//
//  CarPagesViewController.swift
//  EmbeddedVC
//
//  Created by Vova on 9/11/18.
//  Copyright © 2018 Vova. All rights reserved.
//

import UIKit

final class CarPagesViewController: UIPageViewController {

    private var carArray: [String] = []
   
    private enum Constants {
        static let cars = "Cars"
        static let storyboard = "Main"
    }
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        if let array = loadCarsFromPlist() {
            carArray = array
        }
        
        if let firstViewController = viewPageFor(0) {
            setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
        }
    }
    
    private func viewPageFor(_ index: Int) -> CarViewController? {
        if let carViewController = UIStoryboard(name: Constants.storyboard, bundle: nil).instantiateViewController(withIdentifier: Constants.cars) as? CarViewController {
            carViewController.imageFileName = carArray[index]
            carViewController.pageIndex = index
            return carViewController
        }
        return nil
    }
    
    private func loadCarsFromPlist() -> [String]? {
        if let path = Bundle.main.path(forResource: Constants.cars, ofType: "plist"),
            let rawArray = NSArray(contentsOfFile: path) as? [String] {
            return rawArray
        }
        return nil
    }
}

// MARK: UIPageViewControllerDataSource - delegate

extension CarPagesViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let viewController = viewController as? CarViewController
        guard var index = viewController?.pageIndex else {
            return nil
        }

        if index <= 0 {
            return nil
        }
        index -= 1
        return viewPageFor(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let viewController = viewController as? CarViewController
        guard var index = viewController?.pageIndex else {
            return nil
        }
        
        if index >= carArray.count - 1 {
            return nil
        }
        index += 1
        return viewPageFor(index)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return carArray.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
