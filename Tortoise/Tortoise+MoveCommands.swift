//
//  Tortoise+MoveCommands.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

/// Tortoise move commands
public extension Tortoise {

    /// Move the tortoise forward distance pixels.
    /// If the pen is down, a line is drawn.
    /// - parameter distance: Distance
    /// - return: self
    public func Forward(_ distance: Value) -> Tortoise {
        add(command: CommandForward(distance: distance))
        return self
    }

    /// Move the tortoise backwards distance pixels.
    /// Draws a line if the pen is down.
    public func Back(_ distance: Value) -> Tortoise {
        add(command: CommandForward(distance: -distance))
        return self
    }

    /// Rotate the tortoise clockwise through angle degrees.
    public func Right(_ angle: Value) -> Tortoise {
        add(command: CommandRotate(angle: -angle))
        return self
    }

    /// Rotate the tortoise anti-clockwise through angle degrees.
    public func Left(_ angle: Value) -> Tortoise {
        add(command: CommandRotate(angle: angle))
        return self
    }

    /// Move the tortoise to the middle of the screen (position [0 0])
    /// and set its heading to zero (pointing straight up).
    public func Home() -> Tortoise {
        add(command: CommandHome())
        return self
    }

}
