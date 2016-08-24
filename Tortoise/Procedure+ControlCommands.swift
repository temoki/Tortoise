//
//  Tortoise+ControlCommands.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

/// Procedure: Control commands
public extension Procedure {

    // MARK:- Done

    /// Done
    public func Done() {
        // end of method chane
    }


    // MARK:- Define

    /// Define a procedure.
    /// Create procedure name with parameters parameters and statements statements.
    public func Define(_ procedureName: String,
                       _ argumentNames: [String],
                       _ statements: (Procedure) -> Procedure) -> Procedure {
        let procedure = Procedure()
        argumentNames.forEach { (argumentName) in
            procedure.variables[argumentName] = 0
        }
        add(command: CommandDefine(name: procedureName, procedure: statements(procedure)))
        return self
    }


    // MARK:- Call

    /// Call a procedure.
    public func Call(_ procedureName: String, _ arguments: [String: NumberOutput]) -> Procedure {
        add(command: CommandCall(name: procedureName, arguments: arguments))
        return self
    }

    /// Call a procedure.
    public func Call(_ procedureName: String, _ arguments: [String: Number]) -> Procedure {
        var newArguments: [String: NumberOutput] = [:]
        arguments.forEach { (keyValue) in
            newArguments[keyValue.key] = {_ in keyValue.value}
        }
        return Call(procedureName, newArguments)
    }


    // MARK:- Repeat

    /// Run statements statements number times.
    /// - parameter number: Repeat times
    /// - parameter statements: Repeat statements
    /// - returns: self
    public func Repeat(_ times: Number, _ statements: (Procedure) -> Procedure) -> Procedure {
        let procedure = statements(Procedure())
        add(command: CommandRepeat(procedure: procedure, times: times.integer))
        return self
    }


    // MARK:- ShowTortoise

    /// Show the tortoise if it is hidden.
    /// - returns: self
    public func ShowTortoise() -> Procedure {
        add(command: CommandShowTortoise(show: true))
        return self
    }

    // MARK:- HideTortoise

    /// Hide the tortoise. Its position remains the same.
    /// Drawing happens in the same way, and the tortoiseʼs position is affected by drawing commands
    /// in the same way as when it is showing.
    public func HideTortoise() -> Procedure {
        add(command: CommandShowTortoise(show: false))
        return self
    }


    // MARK:- Make (Variable)

    /// Give variable name the value object.
    /// Creates the variable if it doesnʼt exist.
    /// - parameter variableName: Variable name
    /// - parameter number: Number
    /// - returns: self
    public func Make(_ variableName: String, _ number: NumberOutput) -> Procedure {
        add(command: CommandMake(variableName: variableName, number: number))
        return self
    }

    /// Give variable name the value object.
    /// Creates the variable if it doesnʼt exist.
    /// - parameter variableName: Variable name
    /// - parameter number: Number
    /// - returns: self
    public func Make(_ variableName: String, _ number: Number) -> Procedure {
        return Make(variableName, {_ in number})
    }


    // MARK:- Print

    /// Prints out a number to the debug console.
    /// - parameter number: Number
    /// - returns: self
    public func Print(_ number: NumberOutput) -> Procedure {
        add(command: CommandPrint(number: number))
        return self
    }

    /// Prints out a number to the debug console.
    /// - parameter number: Number
    /// - returns: self
    public func Print(_ number: Number) -> Procedure {
        return Print({_ in number})
    }

    /// Prints out a boolean to the debug console.
    /// - parameter number: Number
    /// - returns: self
    public func Print(_ boolean: BoolOutput) -> Procedure {
        add(command: CommandPrint(boolean: boolean))
        return self
    }

    /// Prints out a boolean to the debug console.
    /// - parameter number: Number
    /// - returns: self
    public func Print(_ boolean: Bool) -> Procedure {
        return Print({_ in boolean})
    }

}
