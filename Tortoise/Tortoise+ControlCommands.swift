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


    // MARK:- Make (Variable)

    /// Give variable name the value object.
    /// Creates the variable if it doesnʼt exist.
    /// - parameter variableName: Variable name
    /// - parameter number: Number
    /// - returns: self
    public func Make(_ variableName: String, _ number: NumberOutput) -> Tortoise {
        add(command: CommandMake(variableName: variableName, number: number))
        return self
    }

    /// Give variable name the value object.
    /// Creates the variable if it doesnʼt exist.
    /// - parameter variableName: Variable name
    /// - parameter number: Number
    /// - returns: self
    public func Make(_ variableName: String, _ number: Number) -> Tortoise {
        return Make(variableName, {_ in number})
    }


    // MARK:- Print

    /// Prints out a number to the debug console.
    /// - parameter number: Number
    /// - returns: self
    public func Print(_ number: NumberOutput) -> Tortoise {
        add(command: CommandPrint(number: number))
        return self
    }

    /// Prints out a number to the debug console.
    /// - parameter number: Number
    /// - returns: self
    public func Print(_ number: Number) -> Tortoise {
        return Print({_ in number})
    }

    /// Prints out a boolean to the debug console.
    /// - parameter number: Number
    /// - returns: self
    public func Print(_ boolean: BoolOutput) -> Tortoise {
        add(command: CommandPrint(boolean: boolean))
        return self
    }

    /// Prints out a boolean to the debug console.
    /// - parameter number: Number
    /// - returns: self
    public func Print(_ boolean: Bool) -> Tortoise {
        return Print({_ in boolean})
    }

}
