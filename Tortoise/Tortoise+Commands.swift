//
//  Tortoise+Commands.swift
//  TortoiseDemo
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

/// Tortoise drawing commands
public extension Tortoise {
    
    /// Move the turtle forward distance pixels.
    /// If the pen is down, a line is drawn.
    public func Forward(_ distance: Value) -> Tortoise {
        add(command: CommandForward(distance: distance))
        return self
    }
    
    /// Move the turtle backwards distance pixels.
    /// Draws a line if the pen is down.
    public func Back(_ distance: Value) -> Tortoise {
        add(command: CommandBack(distance: distance))
        return self
    }
    
    /// Rotate the turtle clockwise through angle degrees.
    public func Right(_ angle: Value) -> Tortoise {
        add(command: CommandRight(angle: angle))
        return self
    }

    /// Rotate the turtle anti-clockwise through angle degrees.
    public func Left(_ angle: Value) -> Tortoise {
        add(command: CommandLeft(angle: angle))
        return self
    }
    
}

/// Tortoise control commands
public extension Tortoise {
    
    public func Repeat(_ value: Value, handler: (Void) -> Tortoise) -> Tortoise {
        let repeatTimes = Int(value)
        for _ in 0 ..< repeatTimes {
            let _ = handler()
        }
        return self
    }
    
}
