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
    
    // MARK: - Initializer
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.white()
    }
    
    
    // MARK: - Drawing

    final public override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.saveGState()
        
        // Draw
        draw(withTortoise: Tortoise(cgContext: context, canvasSize: self.bounds.size))
        
        context.restoreGState()
    }
    
    public func draw(withTortoise 🐢: Tortoise) {
    }
    
}
