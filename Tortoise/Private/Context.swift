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
    let canvasWidth: Value
    let canvasHeight: Value

    /// Color Palette
    let colorPalette = ColorPalette()

    /// Tortoise's current state
    var heading: Value = Value(90).radian
    var penDown: Bool = true

    /// Initializer
    /// - parameter context: Graphics context
    required init(cgContext: CGContext, canvasWidth: Value, canvasHeight: Value) {
        self.cgContext = cgContext
        self.canvasWidth = canvasWidth
        self.canvasHeight = canvasHeight
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
        cgContext.translate(x: 0, y: canvasHeight)
        cgContext.scale(x: 1, y: -1)
        cgContext.translate(x: canvasWidth*0.5, y: canvasHeight*0.5)

        // Color
        let color = colorPalette.color(number: 1)
        cgContext.setStrokeColor(color.cgColor)

        // Tortoise's current state
        penDown = true
        home()
    }

    /// Back to home
    func home() {
        heading = Value(90).radian
        cgContext.moveTo(x: 0, y: 0)
    }

}
