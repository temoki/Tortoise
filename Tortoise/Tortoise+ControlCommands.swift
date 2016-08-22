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

    // MARK:- Done

    /// Done
    public func Done() {
        // end of method chane
    }


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


    // MARK:- ShowTortoise

    /// Show the tortoise if it is hidden.
    /// - returns: self
    public func ShowTortoise() -> Tortoise {
        add(command: CommandShowTortoise(show: true))
        return self
    }

    // MARK:- HideTortoise

    /// Hide the tortoise. Its position remains the same.
    /// Drawing happens in the same way, and the tortoiseʼs position is affected by drawing commands
    /// in the same way as when it is showing.
    public func HideTortoise() -> Tortoise {
        add(command: CommandShowTortoise(show: false))
        return self
    }

}
