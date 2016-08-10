//
//  Context.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation
import CoreGraphics

class Context {
    
    /// Graphics context
    var cgContext: CGContext
    
    /// Tortoise's current state
    var posX: Value = 0
    var posY: Value = 0
    var heading: Value = Value(90).radian
    var penDown: Bool = false
    
    /// Initializer
    /// - parameter context: Graphics context
    required init(cgContext: CGContext) {
        self.cgContext = cgContext
    }

}
