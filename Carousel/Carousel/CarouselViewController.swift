//
//  CarousellViewController.swift
//  BluemixV2
//
//  Created by youyue on 16/3/16.
//  Copyright © 2016 youyue. All rights reserved.
//

import UIKit

public class CarouselViewController: UIPageViewController {
    
    weak var carouselViewControllerDelegate: CarouselViewControllerDelegate?
    
    private var imageAmount : Int?
    private var orderedViewControllers = [UIViewController]()
    
    public func setCarouselImage(amount:Int){
        
       self.imageAmount = amount
       
       orderedViewControllers = [UIViewController]()
        
       for var i in 1...amount{
        
         guard let _ = UIImage(named: "CarouselImage\(i)") else{
            i = i + 1 - 1
            fatalError("Please set correct image name")
         }
        
          orderedViewControllers.append(self.newViewController(i))
       }
        
    }
    
    override public init(transitionStyle: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : AnyObject]?) {
        
        super.init(transitionStyle: transitionStyle, navigationOrientation: navigationOrientation, options: options)
    
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.dataSource = self
        self.delegate = self
        
        
    }
    
    override public func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(true)
        
        if let firstViewController = orderedViewControllers.first {
            self.setViewControllers([firstViewController],
                                    direction: .Forward,
                                    animated: true,
                                    completion: nil)
        }
    }
    
    private func newViewController(sequence: Int) -> UIViewController {
        
        let uiViewController = UIViewController()
        uiViewController.view.frame = self.view.frame
        let imageView = UIImageView()
        imageView.image = UIImage(named: "CarouselImage\(sequence)")
        imageView.frame = uiViewController.view.frame
        uiViewController.view.addSubview(imageView)
        
        return uiViewController
    
    }
    
    private func notifyCarouselDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.indexOf(firstViewController) {
    
                carouselViewControllerDelegate?.carouselPageViewController(didUpdatePageIndex: index)
        
        }
    }
    
}

// MARK: UIPageViewControllerDataSource

extension CarouselViewController: UIPageViewControllerDataSource {
    
    public func pageViewController(pageViewController: UIPageViewController,
        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
                return nil
            }
            
            let previousIndex = viewControllerIndex - 1
            
            // User is on the first view controller and swiped left to loop to
            // the last view controller.
            guard previousIndex >= 0 else {
                return orderedViewControllers.last
            }
            
            guard orderedViewControllers.count > previousIndex else {
                return nil
            }
            
            return orderedViewControllers[previousIndex]
    }
    
    public func pageViewController(pageViewController: UIPageViewController,
        viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
                return nil
            }
            
            let nextIndex = viewControllerIndex + 1
            let orderedViewControllersCount = orderedViewControllers.count
            
            // User is on the last view controller and swiped right to loop to
            // the first view controller.
            guard orderedViewControllersCount != nextIndex else {
                return orderedViewControllers.first
            }
            
            guard orderedViewControllersCount > nextIndex else {
                return nil
            }
            
            return orderedViewControllers[nextIndex]
    }
    
}
//Mark: PageViewController Delegate
extension CarouselViewController : UIPageViewControllerDelegate{
    
     public func pageViewController(pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
        
            notifyCarouselDelegateOfNewIndex()
    
    }
    
}

protocol CarouselViewControllerDelegate: class {
    
    /**
       Called when the current index is updated.
     
     - parameter carouselPageViewController: the TutorialPageViewController instance
     - parameter index: the index of the currently visible page.
     */
    func carouselPageViewController(didUpdatePageIndex index: Int)
    
}