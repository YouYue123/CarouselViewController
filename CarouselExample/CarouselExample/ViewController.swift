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

    @IBOutlet weak var carouselPlaceHolder: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let carouselViewController = CarouselViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        
        carouselViewController.view.frame = carouselPlaceHolder.frame
        
        self.addChildViewController(carouselViewController)
        self.view.addSubview(carouselViewController.view)
        
        carouselViewController.setCarouselImage(3)
        
        
        
        //var carouselViewController =
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

