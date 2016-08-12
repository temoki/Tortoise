//
//  Context.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class Context {

    /// Default Values
    static let defaultPosX = Value(0)
    static let defaultPosY = Value(0)
    static let defaultHeading = Value(90)
    static let defaultPenDown = true
    static let defaultPenColor = Int(1)
    static let defaultPenWidth = Value(1)

    /// Graphics context
    let cgContext: CGContext

    /// Canvas Size
    let canvasWidth: Value
    let canvasHeight: Value

    /// Color Palette
    let colorPalette = ColorPalette()

    /// Tortoise's current state
    var heading = Context.defaultHeading
    var penDown = Context.defaultPenDown
    var penColor = Context.defaultPenColor
    var penWidth = Context.defaultPenWidth

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

        // Tortoise's current state
        resetPos()
        resetHeading()
        resetPen()
    }

    func resetPos() {
        cgContext.moveTo(x: Context.defaultPosX, y: Context.defaultPosY)
    }

    func resetHeading() {
        heading = Context.defaultHeading
    }

    func resetPen() {
        penDown = Context.defaultPenDown

        penColor = Context.defaultPenColor
        let color = colorPalette.color(number: penColor)
        cgContext.setStrokeColor(color.cgColor)
        cgContext.setFillColor(color.cgColor)

        penWidth = Context.defaultPenWidth
        cgContext.setLineWidth(penWidth)

    }

}
