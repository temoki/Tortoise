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

    /// Put the pen into draw state.
    /// If the tortoise moves, it will draw a line.
    /// - returns: self
    public func PenDown() -> Tortoise {
        add(command: CommandPenDown(true))
        return self
    }

    /// Put the pen into non-draw state.
    /// - returns: self
    public func PenUp() -> Tortoise {
        add(command: CommandPenDown(false))
        return self
    }

    /// Set the drawing colour to colour-number.
    /// This is the colour number used to draw lines and do fills.
    /// Use SetRGB to set this colour number to a particular colour value.
    /// - parameter number: Color number
    /// - returns: self
    public func SetPenColor(_ number: Number) -> Tortoise {
        add(command: CommandSetPenColor(number: number.integer))
        return self
    }

    /// Set the width of the pen to width.
    /// New lines are drawn with this width.
    /// - parameter width: Pen width
    /// - returns: self
    public func SetPenWidth(_ width: Number) -> Tortoise {
        add(command: CommandSetPenWidth(width))
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
        add(command: CommandSetRGB(number: number.integer, components: components))
        return self
    }

}
