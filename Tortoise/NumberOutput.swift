//
//  NumberOutput.swift
//  Tortoise
//
//  Created by temoki on 2016/08/15.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

/// Behave as number
public enum NumberOutput {
    /// Random number (Max number)
    case Random(Number)

    /// Heading (Function)
    case Heading((Number) -> Number)

    /// Position (Function)
    case Position((Number, Number) -> Number)

    /// Pen width (Function)
    case PenWidth((Number) -> Number)

    /// Pen color (Function)
    case PenColor((Number) -> Number)

    /// Canvas Size (Function)
    case CanvasSize((Number, Number) -> Number)

    /// Value
    case Value(Number)

    /// Expression
    case Expression((TortoiseProperties) -> Number)
}

extension NumberOutput {

    /// Convert to number
    /// - parameter: Context
    /// - returns: Result
    func output(context: Context) -> Number {
        let properties = TortoiseProperties(context: context)
        switch self {
        case .Random(let number):
            return properties.Random(number)

        case .Heading(let function):
            return function(properties.Heading)

        case .Position(let function):
            let position = properties.Position
            return function(position.0, position.1)

        case .PenWidth(let function):
            return function(properties.PenWidth)

        case .PenColor(let function):
            return function(Number(context.penColor))

        case .CanvasSize(let function):
            let size = properties.CanvasSize
            return function(size.0, size.1)

        case .Value(let number):
            return number

        case .Expression(let expression):
            return expression(TortoiseProperties(context: context))
        }
    }

}
