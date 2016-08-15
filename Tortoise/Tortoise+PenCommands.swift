//
//  Tortoise+PenCommands.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

/// Tortoise pen commands
public extension Tortoise {

    // MARK:- PenDown

    /// Put the pen into draw state.
    /// If the tortoise moves, it will draw a line.
    /// - returns: self
    public func PenDown() -> Tortoise {
        add(command: CommandPenDown(true))
        return self
    }


    // MARK:- PenUp

    /// Put the pen into non-draw state.
    /// - returns: self
    public func PenUp() -> Tortoise {
        add(command: CommandPenDown(false))
        return self
    }


    // MARK:- SetPenColor

    /// Set the drawing colour to colour-number.
    /// This is the colour number used to draw lines and do fills.
    /// Use SetRGB to set this colour number to a particular colour value.
    /// - parameter number: Color number
    /// - returns: self
    public func SetPenColor(_ number: NumberOutput) -> Tortoise {
        add(command: CommandSetPenColor(number: number))
        return self
    }

    /// Set the drawing colour to colour-number.
    /// This is the colour number used to draw lines and do fills.
    /// Use SetRGB to set this colour number to a particular colour value.
    /// - parameter number: Color number
    /// - returns: self
    public func SetPenColor(_ number: Number) -> Tortoise {
        return SetPenColor(.Value(number))
    }


    // MARK:- SetPenWidth

    /// Set the width of the pen to width.
    /// New lines are drawn with this width.
    /// - parameter width: Pen width
    /// - returns: self
    public func SetPenWidth(_ width: NumberOutput) -> Tortoise {
        add(command: CommandSetPenWidth(width))
        return self
    }

    /// Set the width of the pen to width.
    /// New lines are drawn with this width.
    /// - parameter width: Pen width
    /// - returns: self
    public func SetPenWidth(_ width: Number) -> Tortoise {
        return SetPenWidth(.Value(width))
    }


    // MARK:- SetRGB

    /// Set red, green, and blue components of colour colour-number to red, green, blue.
    /// Each component is a number between 0.0 and 1.0. 0.0 means that
    /// none of that component is present,  while 1.0 means all of it is present.
    /// So, [1.0 0.0 0.0] is a bright red and [0.0 0.0 1.0] is a bright blue.
    /// Black is [0.0 0.0 0.0] and white is [1.0 1.0 1.0].
    /// If opacity is specified, the colour has the specified opacity -
    /// 0.0 is completely transparent, 1.0 is completely opaque.
    /// - parameter number: Color number
    /// - parameter componets: RGB and Opacity components
    /// - returns: self
    public func SetRGB(_ number: NumberOutput, _ components: [NumberOutput]) -> Tortoise {
        add(command: CommandSetRGB(number: number, components: components))
        return self
    }

    /// Set red, green, and blue components of colour colour-number to red, green, blue.
    /// Each component is a number between 0.0 and 1.0. 0.0 means that
    /// none of that component is present,  while 1.0 means all of it is present.
    /// So, [1.0 0.0 0.0] is a bright red and [0.0 0.0 1.0] is a bright blue.
    /// Black is [0.0 0.0 0.0] and white is [1.0 1.0 1.0].
    /// If opacity is specified, the colour has the specified opacity -
    /// 0.0 is completely transparent, 1.0 is completely opaque.
    /// - parameter number: Color number
    /// - parameter componets: RGB and Opacity components
    /// - returns: self
    public func SetRGB(_ number: Number, _ components: [Number]) -> Tortoise {
        return SetRGB(.Value(number), components.map { .Value($0) })
    }

}
