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

    // MARK: - Done

    /// Done
    public func Done() {
        // end of method chain
    }

    // MARK: - ShowTortoise

    /// Show the tortoise if it is hidden.
    /// - returns: self
    public func ShowTortoise() -> Procedure {
        add(command: CommandShowTortoise(show: true))
        return self
    }

    // MARK: - HideTortoise

    /// Hide the tortoise. Its position remains the same.
    /// Drawing happens in the same way, and the tortoiseʼs position is affected by drawing commands
    /// in the same way as when it is showing.
    public func HideTortoise() -> Procedure {
        add(command: CommandShowTortoise(show: false))
        return self
    }

    // MARK: - Define (Procedure)

    /// Define a procedure.
    /// Create procedure name with parameters parameters and statements statements.
    /// - parameter procedureName: Procedure name
    /// - parameter parameterNames: Parameter names
    /// - parameter statements: Procedure statements
    /// - returns: self
    public func Define(_ procedureName: String,
                       _ parameterNames: [String],
                       _ statements: (Procedure) -> Procedure) -> Procedure {
        let procedure = Procedure()
        parameterNames.forEach { (parameterName) in
            procedure.variables[parameterName] = 0
        }
        add(command: CommandDefine(name: procedureName, procedure: statements(procedure)))
        return self
    }

    // MARK: - Call (Procedure)

    /// Call a procedure with parameters.
    /// - parameter procedureName: Procedure name
    /// - parameter parameters: Parameters
    /// - returns: self
    public func Call(_ procedureName: String, _ parameters: [String: NumberOutput]) -> Procedure {
        add(command: CommandCall(name: procedureName, parameters: parameters))
        return self
    }

    /// Call a procedure with parameters.
    /// - parameter procedureName: Procedure name
    /// - parameter parameters: Parameters
    /// - returns: self
    public func Call(_ procedureName: String, _ parameters: [String: Number]) -> Procedure {
        var newParameters: [String: NumberOutput] = [:]
        parameters.forEach { (keyValue) in
            newParameters[keyValue.key] = {_ in keyValue.value}
        }
        return Call(procedureName, newParameters)
    }

    // MARK: - Repeat

    /// Run statements statements number times.
    /// - parameter number: Repeat times
    /// - parameter statements: Repeat statements
    /// - returns: self
    public func Repeat(_ number: NumberOutput,
                       _ statements: (Procedure) -> Procedure) -> Procedure {
        let procedure = statements(Procedure())
        add(command: CommandRepeat(number: number, procedure: procedure))
        return self
    }

    /// Run statements statements number times.
    /// - parameter number: Repeat times
    /// - parameter statements: Repeat statements
    /// - returns: self
    public func Repeat(_ number: Number, _ statements: (Procedure) -> Procedure) -> Procedure {
        return Repeat({_ in number}, statements)
    }

    // MARK: - While

    /// Run statements statements while condition is true.
    /// - parameter condition: condition
    /// - parameter statements: Repeat statements
    /// - returns: self
    public func While(_ condition: BoolOutput,
                      _ statements: (Procedure) -> Procedure) -> Procedure {
        let procedure = statements(Procedure())
        add(command: CommandWhile(condition: condition, procedure: procedure))
        return self
    }

    // MARK: - If

    /// If condition condition is true, execute true-statements, otherwise execute false-statements.
    /// - parameter condition: condition
    /// - parameter Then: True-statements
    /// - parameter Else: False-statements
    /// - returns: self
    public func If(_ condition: BoolOutput,
                   Then: (Procedure) -> Procedure,
                   Else: (Procedure) -> Procedure) -> Procedure {
        let thenProcedure = Then(Procedure())
        let elseProcedure = Else(Procedure())
        add(command: CommandIf(condition: condition,
                               thenProcedure: thenProcedure,
                               elseProcedure: elseProcedure))
        return self
    }

    /// If condition condition is true, execute true-statements, otherwise execute false-statements.
    /// - parameter condition: condition
    /// - parameter Then: True-statements
    /// - parameter Else: False-statements
    /// - returns: self
    public func If(_ condition: Bool,
                   Then: (Procedure) -> Procedure,
                   Else: (Procedure) -> Procedure) -> Procedure {
        return If({_ in condition}, Then: Then, Else: Else)
    }

    // MARK: - Make (Variable)

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

    // MARK: - Local (Variable)

    /// Declare a name as local to a procedure - effectively a local variable.
    /// - parameter variableName: Variable name
    /// - parameter number: Number
    /// - returns: self
    public func Local(_ variableName: String, _ number: NumberOutput) -> Procedure {
        add(command: CommandLocal(variableName: variableName, number: number))
        return self
    }

    /// Declare a name as local to a procedure - effectively a local variable.
    /// - parameter variableName: Variable name
    /// - parameter number: Number
    /// - returns: self
    public func Local(_ variableName: String, _ number: Number) -> Procedure {
        return Local(variableName, {_ in number})
    }

    // MARK: - Print

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
