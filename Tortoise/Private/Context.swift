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
    let cgContext: CGContext

    /// Canvas Size
    let canvasSize: Size

    /// Tortoise's current state
    var heading: Value = Value(90).radian
    var penDown: Bool = true

    /// Initializer
    /// - parameter context: Graphics context
    required init(cgContext: CGContext, canvasSize: CGSize) {
        self.cgContext = cgContext
        self.canvasSize = canvasSize
        self.cgContext.saveGState()
        self.reset()
    }

    /// Deinit
    deinit {
        cgContext.restoreGState()
    }

    /// Reset context
    func reset() {
        cgContext.restoreGState()
        cgContext.saveGState()

        // Convert origin
        cgContext.translate(x: 0, y: canvasSize.height)
        cgContext.scale(x: 1, y: -1)
        cgContext.translate(x: canvasSize.width*0.5, y: canvasSize.height*0.5)

        penDown = true
        home()
    }

    /// Back to home
    func home() {
        heading = Value(90).radian
        cgContext.moveTo(x: 0, y: 0)
    }

}
