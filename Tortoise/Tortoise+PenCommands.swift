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
    /// - parameter number: Color number
    /// - return: self
    /// Use SetRGB to set this colour number to a particular colour value.
    public func SetPenColor(_ number: Value) -> Tortoise {
        add(command: CommandSetPenColor(number: number.number))
        return self
    }

    /// Set the width of the pen to width.
    /// New lines are drawn with this width.
    /// - parameter width: Pen width
    /// - return: self
    public func SetPenWidth(_ width: Value) -> Tortoise {
        add(command: CommandSetPenWidth(width))
        return self
    }
}
