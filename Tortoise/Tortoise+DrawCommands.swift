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

    /// Put a dot of the current colour at position x y on the screen.
    /// Note that positive y-values go up the screen.
    /// - parameter x: X coordinate
    /// - parameter y: Y coordinate
    /// - returns: self
    public func Dot(_ x: Number, _ y: Number) -> Tortoise {
        add(command: CommandDot(x: x, y: y))
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
        add(command: CommandArc(angle: angle, radius: radius))
        return self
    }

}
