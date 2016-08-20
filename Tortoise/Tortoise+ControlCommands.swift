//
//  Tortoise+ControlCommands.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

/// Tortoise control commands
public extension Tortoise {

    // MARK:- Repeat

    /// Run statements statements number times.
    /// - parameter number: Repeat times
    /// - parameter statements: Repeat statements
    /// - returns: self
    public func Repeat(_ times: Number, _ statements: (Void) -> Tortoise) -> Tortoise {
        for _ in 0 ..< times.integer {
            let _ = statements()
        }
        return self
    }


    // MARK:- ShowTurtle

    /// Show the turtle if it is hidden.
    /// - returns: self
    public func ShowTurtle() -> Tortoise {
        add(command: CommandShowTurtle(show: true))
        return self
    }

    // MARK:- HideTurtle

    /// Hide the turtle. Its position remains the same.
    /// Drawing happens in the same way, and the turtleʼs position is affected by drawing commands
    /// in the same way as when it is showing.
    public func HideTurtle() -> Tortoise {
        add(command: CommandShowTurtle(show: false))
        return self
    }

}
