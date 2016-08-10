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
    public required init(cgContext: CGContext, canvasSize: Size) {
        context = Context(cgContext: cgContext, canvasSize: canvasSize)
    }

    /// Run commands
    public func Run() {
        context.reset()
        commands.append(CommandDrawTortoise())
        commands.forEach { (command) in
            command.execute(context: context)
        }
        commands.removeAll()
    }

    /// Add command
    internal func add(command: Command) {
        commands.append(command)
    }

}
