//
//  TortoiseProperties.swift
//  Tortoise
//
//  Created by temoki on 2016/08/15.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

// swiftlint:disable variable_name

/// Tortoise Properties
public class TortoiseProperties {

    /// Context
    let context: Context

    /// Initializer
    /// - parameter context: Context
    init(context: Context) {
        self.context = context
    }


    // MARK: - Calculation

    /// Random
    public func Random(_ max: Number) -> Number {
        let upperBound = UInt32(Swift.min(Swift.max(max.integer, 0), Int(UInt32.max)))
        return Number(arc4random_uniform(upperBound))
    }

    /// Towards
    public func Towards(_ x: Number, _ y: Number) -> Number {
        let tan = (y - context.posY) / (x - context.posX)
        return atan(tan).degree
    }


    // MARK: - Tortoise properties

    /// Shown
    public var Shown: Bool {
        return context.show
    }

    /// Heading
    public var Heading: Number {
        return context.heading
    }

    /// Position
    public var Position: (x: Number, y: Number) {
        return (x: context.posX, y: context.posY)
    }

    /// Pen width
    public var PenWidth: Number {
        return context.penWidth
    }

    /// Pen color
    public var PenColor: Number {
        return Number(context.penColor)
    }

    /// RGB
    public func RGB(_ number: Number) -> [Number] {
        return context.colorPalette.color(number: number.integer).components
    }

    /// Canvas size
    public var CanvasSize: (width: Number, height: Number) {
        return (width: context.canvasWidth, height: context.canvasHeight)
    }

}

// swiftlint:enable variable_name
