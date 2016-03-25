//
//  ViewController.swift
//  CarouselExample
//
//  Created by youyue on 25/3/16.
//  Copyright © 2016 youyue. All rights reserved.
//

import UIKit
import Carousel
class ViewController: UIViewController {

    @IBOutlet weak var indicator: UIImageView!
    @IBOutlet weak var carouselPlaceHolder: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let carouselViewController = CarouselViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        
        carouselViewController.carouselViewControllerDelegate = self
        
        carouselViewController.view.frame = carouselPlaceHolder.frame
        
        self.addChildViewController(carouselViewController)
        self.view.addSubview(carouselViewController.view)
        //self.view.insertSubview(carouselViewController.view, belowSubview: logo)
        
        carouselViewController.setCarouselImage(3)
        
        //var carouselViewController =
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController : CarouselViewControllerDelegate{
    
    func carouselPageViewController(didUpdatePageIndex index: Int){
        
        indicator.image = UIImage(named: "Dots\(index+1)")
        
    }
}


