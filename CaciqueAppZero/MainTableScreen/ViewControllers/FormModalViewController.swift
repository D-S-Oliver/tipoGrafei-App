//
//  FormModalViewController.swift
//  tipoGrafei
//
//  Created by Marcos Chevis on 25/06/21.
//

import Foundation
import UIKit

class FormModalViewController: UIPageViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextStepButton: UIButton!
    
    
    var viewControllerIndex: Int = 0
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [createViewController(name: "FirstFormView"),
                createViewController(name: "SecondFormView"),
                createViewController(name: "ResultFormView")
        ]
    }()
    
    private func createViewController(name: String) -> UIViewController {
        return UIStoryboard(name: name, bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        dataSource = self
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
}

extension FormModalViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
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
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
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
    
    
}

extension FormModalViewController: UIPageViewControllerDelegate {
    
}
