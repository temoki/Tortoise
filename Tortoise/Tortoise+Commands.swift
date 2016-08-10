//
//  Tortoise+Commands.swift
//  TortoiseDemo
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

/// Tortoise commands
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

    /// Put the pen into draw state.
    /// If the tortoise moves, it will draw a line.
    public func PenDown() -> Tortoise {
        add(command: CommandPenDown(true))
        return self
    }

    /// Put the pen into non-draw state.
    public func PenUp() -> Tortoise {
        add(command: CommandPenDown(false))
        return self
    }

}

/// Tortoise control commands
public extension Tortoise {

    /// Run statements statements number times.
    public func Repeat(_ number: Value, statements: (Void) -> Tortoise) -> Tortoise {
        for _ in 0 ..< Int(number) {
            let _ = statements()
        }
        return self
    }

}
