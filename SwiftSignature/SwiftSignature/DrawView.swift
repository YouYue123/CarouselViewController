//
//  DrawView.swift
//  SwiftSignature
//
//  Created by youyue on 28/3/16.
//  Copyright © 2016 youyue. All rights reserved.
//

import UIKit

class DrawView: UIView {

    var lines = [Line]()
    var lastPoint : CGPoint!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        lastPoint = touches.first?.locationInView(self)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let newPoint = touches.first?.locationInView(self)
        lines.append(Line(start: lastPoint,end: newPoint!))
        lastPoint = newPoint
        
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        
        for line in lines{
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
        }
        
        CGContextSetRGBStrokeColor(context, 0, 0, 0, 1)
        CGContextSetLineCap(context, .Round)
        CGContextSetLineWidth(context, 5)
        CGContextStrokePath(context)
        
    }
    
}
