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

    /// Initializer
    /// - parameter context: Graphics context
    public required init(canvasWidth: Number, canvasHeight: Number) {
        context = Context(canvasWidth: canvasWidth, canvasHeight: canvasHeight)
    }

    /// Run all commands
    public func Run() {
        context.resetAll()
        commands.append(CommandDrawTortoise())
        commands.forEach { (command) in
            command.execute(context: context)
        }
    }

    /// Clear all commands
    public func Clear() {
        commands.removeAll()
    }

    /// Drawn bitmap image
    public var Image: CGImage? {
        // swiftlint:disable:previous variable_name
        return context.outputImage
    }

    /// Add command
    internal func add(command: Command) {
        commands.append(command)
    }

}
