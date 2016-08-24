//
//  Properties.swift
//  Tortoise
//
//  Created by temoki on 2016/08/15.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

// swiftlint:disable variable_name

/// Properties
public class Properties {

    /// Context
    let context: Context

    /// Initializer
    /// - parameter context: Context
    internal init(context: Context) {
        self.context = context
    }


    // MARK: - Variable

    public subscript(variableName: String) -> Number {
        get {
            let reversed = context.localVariablesStack.reversed()
            for variables in reversed {
                if let value = variables[variableName] {
                    return value
                }
            }
            // If local variable does not exist, return global variable.
            return context.globalVariables[variableName]!
        }
    }


    // MARK: - Calculation

    /// Output a random integer between zero and number.
    /// - parameter max: Max number
    /// - returns: Random number
    public func Random(_ max: Number) -> Number {
        let upperBound = UInt32(Swift.min(Swift.max(max.integer, 0), Int(UInt32.max)))
        return Number(arc4random_uniform(upperBound))
    }

    /// Output the angle which the tortoiseʼs heading must be set to to point towards position x,y.
    /// - parameter x: Towards position x
    /// - parameter y: Towards position y
    /// - returns: Angle
    public func Towards(_ x: Number, _ y: Number) -> Number {
        let tan = (y - context.posY) / (x - context.posX)
        return atan(tan).degree
    }


    // MARK: - Tortoise properties

    /// Shown
    public var Shown: Bool {
        return context.show
    }

    /// Output the heading angle of the tortoise.
    /// This is the angle the tortoise faces,
    /// and the angle it will move in if the Forward command is used.
    /// A heading of zero is facing straight up.
    /// The heading increases in a clockwise direction - a heading of 90 is pointing to the right,
    /// 180 is pointing straight down, 270 is pointing to the left.
    /// When the heading reaches 360, it is reset to zero.
    public var Heading: Number {
        return context.heading
    }

    /// Output a list containing the tortoiseʼs x and y co-ordinates.
    public var Position: (x: Number, y: Number) {
        return (x: context.posX, y: context.posY)
    }

    /// Output the size of the drawing pen.
    /// This determines the width of lines that are drawn by the tortoise.
    public var PenWidth: Number {
        return context.penWidth
    }

    /// Output the Pen colour number.
    /// This is the colour number which will be used when lines are drawn or fills are done.
    /// At startup, the Pen colour is set to 1.
    public var PenColor: Number {
        return Number(context.penColor)
    }

    /// Output the number of the background colour.
    /// This is the colour used to fill the graphics window when ClearScreen is called.
    /// At startup, the background colour is set to zero.
    /// This is initially white, but can be changed with SetRGB.
    public var Background: Number {
        return Number(context.backgroundColor)
    }

    /// Output the red, green, and blue components of colour colour-number.
    /// Each component is a number between 0.0 and 1.0.
    /// Because of the way colours are held within macOS,
    /// the values returned from RGB may be slightly different from those set with SetRGB.
    public func RGB(_ number: Number) -> [Number] {
        return context.colorPalette.color(number: number.integer).components
    }

    /// Outputs the width and height of the canvas (drawing area) as a list.
    public var CanvasSize: (width: Number, height: Number) {
        return (width: context.canvasWidth, height: context.canvasHeight)
    }

}

// swiftlint:enable variable_name
