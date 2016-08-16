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
    static let defaultPosX = Number(0)
    static let defaultPosY = Number(0)
    static let defaultHeading = Number(90)
    static let defaultPenDown = true
    static let defaultPenColor = Int(1)
    static let defaultPenWidth = Number(1)

    /// Bitmap context
    let bitmapContext: CGContext

    /// Canvas Size
    let canvasWidth: Number
    let canvasHeight: Number

    /// Color Palette
    let colorPalette = ColorPalette()

    /// Tortoise's current state
    var posX = Context.defaultPosX
    var posY = Context.defaultPosY
    var heading = Context.defaultHeading
    var penDown = Context.defaultPenDown
    var penColor = Context.defaultPenColor
    var penWidth = Context.defaultPenWidth

    /// Initializer
    /// - parameter context: Graphics context
    required init(canvasWidth: Number, canvasHeight: Number) {
        self.bitmapContext = CGContext(data: nil,
                                       width: canvasWidth.integer,
                                       height: canvasHeight.integer,
                                       bitsPerComponent: 8,
                                       bytesPerRow: canvasWidth.integer * 4,
                                       space: CGColorSpaceCreateDeviceRGB(),
                                       bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue)!
        // swiftlint:disable:previous force_unwrapping

        self.canvasWidth = canvasWidth
        self.canvasHeight = canvasHeight
    }

    /// Reset all
    func resetAll() {
        resetCanvas()
        setPosition()
        setHeading()
        setPen()
    }

    /// Reset canvas
    func resetCanvas() {
        // Convert origin
        bitmapContext.translate(x: 0, y: canvasHeight)
        bitmapContext.scale(x: 1, y: -1)
        bitmapContext.translate(x: canvasWidth*0.5, y: canvasHeight*0.5)

        let clearRect = CGRect(x: 0, y: 0, width: canvasWidth, height: canvasHeight)
        bitmapContext.clear(clearRect)
        bitmapContext.saveGState()
        bitmapContext.setFillColor(CGColor.clearColor)
        bitmapContext.fill(clearRect)
        bitmapContext.restoreGState()
    }

    /// Set position
    func setPosition(x: Number = Context.defaultPosX, y: Number = Context.defaultPosY) {
        posX = x
        posY = y
        bitmapContext.moveTo(x: posX, y: posY)
    }

    /// Set heading
    func setHeading(_ heading: Number = Context.defaultHeading) {
        self.heading = heading
    }

    /// Set pen state
    func setPen(down: Bool = Context.defaultPenDown,
                color: Int = Context.defaultPenColor,
                width: Number = Context.defaultPenWidth) {
        penDown = down

        penColor = color
        let rgbColor = colorPalette.color(number: penColor)
        bitmapContext.setStrokeColor(rgbColor.cgColor)
        bitmapContext.setFillColor(rgbColor.cgColor)

        penWidth = width
        bitmapContext.setLineWidth(penWidth)

    }

    // Output CGImage
    var outputImage: CGImage? {
        bitmapContext.flush()
        return bitmapContext.makeImage()
    }

}
