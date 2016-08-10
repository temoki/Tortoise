//
//  Canvas.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import UIKit

/// Tortoise Graphics Canvas for iOS
public class Canvas: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.white()
    }
    
    final public override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.saveGState()
        
        // Convert origin
        context.translate(x: 0, y: self.bounds.height)
        context.scale(x: 1, y: -1)
        context.translate(x: self.bounds.width*0.5, y: self.bounds.height*0.5)
        
        // Draw
        draw(withTortoise: Tortoise(cgContext: context))
        
        context.restoreGState()
    }
    
    public func draw(withTortoise tortoise: Tortoise) {
    }
    
}
