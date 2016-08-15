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

    /// Random
    public func Random(_ max: Number) -> Number {
        let upperBound = UInt32(Swift.min(Swift.max(max.integer, 0), Int(UInt32.max)))
        return Number(arc4random_uniform(upperBound))
    }

    /// Heading
    public var Heading: Number {
        return context.heading
    }

    /// Position
    public var Position: (x: Number, y: Number) {
        let position = context.cgContext.currentPointOfPath
        return (x: position.x, y: position.y)
    }

    /// Pen width
    public var PenWidth: Number {
        return context.penWidth
    }

    /// Pen color
    public var PenColor: Number {
        return Number(context.penColor)
    }

    /// Canvas size
    public var CanvasSize: (width: Number, height: Number) {
        return (width: context.canvasWidth, height: context.canvasHeight)
    }

}

// swiftlint:enable variable_name
