//
//  Context.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class Context {

    // MARK:- Constant values

    static let mainProcedureName = "🐢"
    static let defaultShowTortoise = true
    static let defaultPosition = CGPoint.zero
    static let defaultHeading = Number(90)
    static let defaultPenDown = true
    static let defaultPenColor = 1
    static let defaultPenWidth = Number(1)
    static let defaultBackgroundColor = 0

    // MARK:- Properties (Canvas)

    /// Bitmap context
    let bitmapContext: CGContext

    /// Canvas rect
    let canvasRect: CGRect

    /// Tortoise icon mage
    let tortoiseImage: CGImage?

    /// Color Palette
    let colorPalette: ColorPalette


    // MARK:- Properties (Current State)

    private(set) var backgroundColor = Context.defaultBackgroundColor
    private(set) var showTortoise = Context.defaultShowTortoise
    private(set) var position = Context.defaultPosition
    private(set) var heading = Context.defaultHeading
    private(set) var penDown = Context.defaultPenDown
    private(set) var penColor = Context.defaultPenColor
    private(set) var penWidth = Context.defaultPenWidth


    // MARK:- Properties (Variables & Procedures)

    /// Variables stack [variable-name: value]
    var variablesStack: [[String: Number]]

    // Procdures [procedure-name: procedure]
    var procedures: [String: Procedure]


    /// Initializer
    /// - parameter canvasSize: Canvas size
    /// - parameter tortoiseImage: Tortoise icon image
    required init(canvasSize: CGSize, tortoiseImage: CGImage? = nil) {
        let halfWidth = canvasSize.width * 0.5
        let halfHeight = canvasSize.height * 0.5

        // Init properties of canvas.
        self.bitmapContext = CGContext(data: nil,
                                       width: canvasSize.width.integer,
                                       height: canvasSize.height.integer,
                                       bitsPerComponent: 8,
                                       bytesPerRow: canvasSize.width.integer * 4,
                                       space: CGColorSpaceCreateDeviceRGB(),
                                       bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue)!
        // swiftlint:disable:previous force_unwrapping
        self.canvasRect = CGRect(origin: CGPoint(x: -halfWidth, y: -halfHeight), size: canvasSize)
        self.tortoiseImage = tortoiseImage
        self.colorPalette = ColorPalette()

        // Convert bitmap origin
        self.bitmapContext.translateBy(x: 0, y: canvasSize.height)
        self.bitmapContext.scaleBy(x: 1, y: -1)
        self.bitmapContext.translateBy(x: halfWidth, y: halfHeight)

        self.variablesStack = [[:]]
        self.procedures = [Context.mainProcedureName: Procedure()]
    }


    // MARK: Methods

    /// Make rendered CGImage
    func makeRenderedImage() -> CGImage? {
        bitmapContext.flush()
        return bitmapContext.makeImage()
    }

    /// Reset context
    func reset() {
        self.variablesStack = [[:]]
        self.procedures = [Context.mainProcedureName: Procedure()]
        colorPalette.reset()
        clearScreen()
    }

    /// Clear screen
    func clearScreen() {
        setBackgroundColor()
        clean()

        setShowTortoise()
        setPosition()
        setHeading()
        setPenDown()
        setPenColor()
        setPenWidth()
    }

    /// Clean
    func clean() {
        bitmapContext.clear(canvasRect)
        bitmapContext.saveGState()
        let rgbColor = colorPalette.color(number: backgroundColor)
        bitmapContext.setFillColor(rgbColor.cgColor)
        bitmapContext.fill(canvasRect)
        bitmapContext.restoreGState()
    }

    func setBackgroundColor(_ backgroundColor: Int = Context.defaultBackgroundColor) {
        self.backgroundColor = backgroundColor
    }

    func setShowTortoise(_ showTortoise: Bool = Context.defaultShowTortoise) {
        self.showTortoise = showTortoise
    }

    func setPosition(_ position: CGPoint = Context.defaultPosition) {
        self.position = position
        bitmapContext.move(to: position)
    }

    func setHeading(_ heading: Number = Context.defaultHeading) {
        self.heading = heading
    }

    func setPenDown(_ penDown: Bool = Context.defaultPenDown) {
        self.penDown = penDown
    }

    func setPenColor(_ penColor: Int = Context.defaultPenColor) {
        self.penColor = penColor
        let rgbColor = colorPalette.color(number: penColor)
        bitmapContext.setStrokeColor(rgbColor.cgColor)
        bitmapContext.setFillColor(rgbColor.cgColor)
    }

    func setPenWidth(_ penWidth: Number = Context.defaultPenWidth) {
        self.penWidth = penWidth
        bitmapContext.setLineWidth(penWidth)
    }

}
