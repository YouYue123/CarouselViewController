# CarouselViewController

An ios swift carousel viewcontroller

## Requirements

- iOS 9.0+
- Xcode 7.2 

## Installation

or use [CocoaPods](https://cocoapods.org) with Podfile:
``` ruby
pod 'CarouselViewController', '~> 1.0.2'
``` 
## Usage
1) Create CarouselViewController by setting its transition style, navigation orientation and other options

``` swift
     let carouselViewController = CarouselViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
```
2) If comform update page index delegate which is used to notify current page number as below
``` swift
    extension ViewController : CarouselViewControllerDelegate{
    
     func carouselPageViewController(didUpdatePageIndex index: Int){
        
        indicator.image = UIImage(named: "Dots\(index+1)")
        
     }
   }
```   
   then set delegate
``` swift
    carouselViewController.carouselViewControllerDelegate = self
```
3) Set carousel view's frame and added it into current view controller
```swift
     carouselViewController.view.frame = CGRecMake(0,0,100,100)
     self.addChildViewController(carouselViewController)
     self.view.addSubview(carouselViewController.view)
```
4) Set carousel image number
```swift
   carouselViewController.setCarouselImage(3)
```
## Important
   Make sure the image resource is set to correct name (CarouselImage'X',such as CarouselImage1,CarouselImage2,CarouselImage3)

## Licence
CarouselViewController is released under the MIT license.
See [LICENSE](./LICENSE) for details.
