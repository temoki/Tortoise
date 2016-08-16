//
//  Tortoise.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

/// Tortoise
final public class Tortoise {

    /// Context
    private let context: Context

    /// Commands
    private var commands: [Command] = []

    /// Next run command index
    private var nextCommand: Int = 0

    /// Initializer
    /// - parameter context: Graphics context
    public required init(canvasWidth: Number, canvasHeight: Number) {
        context = Context(canvasWidth: canvasWidth, canvasHeight: canvasHeight)
    }

    /// Done
    public func Done() {
    }

    /// Run all commands
    public func RunAll() {
        nextCommand = 0
        context.resetAll()
        commands.forEach { (command) in
            command.execute(context: context)
        }
        CommandDrawTortoise().execute(context: context)
    }

    /// Run next command
    /// - returns: whether it has next
    public func RunNext() -> Bool {
        // Check whethre it has next
        guard nextCommand < commands.count else {
            CommandDrawTortoise().execute(context: context)
            nextCommand = 0
            return false
        }

        // At first time, reset context
        if nextCommand == 0 {
            context.resetAll()
        }

        // Run command
        context.restoreBitmapContext()
        commands[nextCommand].execute(context: context)

        nextCommand += 1
        return true
    }

    /// Clear all commands
    public func Clear() {
        nextCommand = 0
        commands.removeAll()
    }

    /// Drawn bitmap image
    public var Image: CGImage? {
        // swiftlint:disable:previous variable_name
        return context.outputImage
    }


    // MARK: Internal

    /// Add command
    internal func add(command: Command) {
        commands.append(command)
    }

}
