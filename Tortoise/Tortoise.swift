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
        // end of method chane
    }

    /// Run all commands
    public func RunAll() {
        nextCommand = 0
        context.resetBitmapContext()
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
            nextCommand = 0
            return false
        }

        // Run commands
        context.resetBitmapContext()
        for i in 0...nextCommand {
            commands[i].execute(context: context)
        }
        CommandDrawTortoise().execute(context: context)

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
