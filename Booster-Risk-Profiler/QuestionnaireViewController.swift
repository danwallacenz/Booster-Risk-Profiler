//
//  QuestionnaireViewController.swift
//  Booster-Risk-Profiler
//
//  Created by Daniel Wallace on 17/01/17.
//  Copyright © 2017 Daniel Wallace. All rights reserved.
//

import UIKit

class QuestionnaireViewController: UIPageViewController {

    private(set) lazy var orderedViewControllers: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc2 = storyboard.instantiateViewController(withIdentifier: "Q2ViewController")
        let vc4 = storyboard.instantiateViewController(withIdentifier: "Q4ViewController")
        return [vc2, vc4]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        stylePageControl()
    }
}

// MARK: UIPageViewControllerDataSource
extension QuestionnaireViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        return orderedViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        return orderedViewControllers[previousIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else {
                return 0
        }
        return firstViewControllerIndex
    }
    
    fileprivate func stylePageControl() {
        let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [type(of: self)])
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0, green: 114/214.0, blue: 191/256.0, alpha: 1.0)
        pageControl.pageIndicatorTintColor = UIColor(red: 192/256.0, green: 231/256.0, blue: 144/256.0, alpha: 1)
        pageControl.backgroundColor = UIColor(red: 243/256.0, green: 249/256.0, blue: 236/256.0, alpha: 1.0)
    }
}
