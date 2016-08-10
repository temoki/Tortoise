//
//  Context.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class Context {
    
    /// Graphics context
    var cgContext: CGContext
    
    /// Canvas Size
    var canvasSize: Size
    
    /// Tortoise's current state
    var heading: Value = Value(90).radian
    var penDown: Bool = true
    
    /// Initializer
    /// - parameter context: Graphics context
    required init(cgContext: CGContext, canvasSize: CGSize) {
        self.cgContext = cgContext
        self.canvasSize = canvasSize
        self.cgContext.saveGState()
    }
    
    deinit {
        self.cgContext.restoreGState()
    }

}
