//
//  Tortoise+DrawCommands.swift
//  Tortoise
//
//  Created by temoki on 2016/08/12.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

/// Tortoise draw commands
public extension Tortoise {

    // MARK: - ClearScreen

    /// Clear the graphics screen and set the tortoise to its home position.
    /// The graphics screen is filled with the current background pen colour.
    /// The same as doing Clean followed by Home.
    public func ClearScreen() -> Tortoise {
        add(command: CommandClearScreen())
        return self
    }


    // MARK: - Clean

    /// Clear the graphics screen without affecting the tortoise.
    /// The graphics screen is filled with the current background pen colour.
    public func Clean() -> Tortoise {
        add(command: CommandClean())
        return self
    }


    // MARK:- Dot

    /// Put a dot of the current colour at position x y on the screen.
    /// Note that positive y-values go up the screen.
    /// - parameter x: X coordinate
    /// - parameter y: Y coordinate
    /// - returns: self
    public func Dot(_ x: NumberOutput, _ y: NumberOutput) -> Tortoise {
        add(command: CommandDot(x: x, y: y))
        return self
    }

    /// Put a dot of the current colour at position x y on the screen.
    /// Note that positive y-values go up the screen.
    /// - parameter x: X coordinate
    /// - parameter y: Y coordinate
    /// - returns: self
    public func Dot(_ x: Number, _ y: Number) -> Tortoise {
        return Dot({_ in x}, {_ in y})
    }


    // MARK:- Arc

    /// Draws an arc of radius radius,
    /// entred on the current tortoise position and starting
    /// at the current heading, sweeping clockwise through angle angle.
    /// Draws a line if the pen is down.
    /// - parameter angle: Angle (degree)
    /// - parameter radius: Radius
    /// - returns: self
    public func Arc(_ angle: NumberOutput, _ radius: NumberOutput) -> Tortoise {
        add(command: CommandArc(angle: angle, radius: radius))
        return self
    }

    /// Draws an arc of radius radius,
    /// entred on the current tortoise position and starting
    /// at the current heading, sweeping clockwise through angle angle.
    /// Draws a line if the pen is down.
    /// - parameter angle: Angle (degree)
    /// - parameter radius: Radius
    /// - returns: self
    public func Arc(_ angle: Number, _ radius: Number) -> Tortoise {
        return Arc({_ in angle}, {_ in radius})
    }

}
