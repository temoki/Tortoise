//
//  Tortoise.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

/// Tortoise
final public class Tortoise {

    /// Main procedure
    public let 🐢: Procedure

    /// Context
    private let context: Context

    /// Initializer
    public required init(canvasWidth: Number, canvasHeight: Number, tortoiseImage: CGImage? = nil) {
        context = Context(canvasWidth: canvasWidth,
                          canvasHeight: canvasHeight,
                          tortoiseImage: tortoiseImage)
        🐢 = Procedure()
        context.procedures[Context.mainProcedureName] = 🐢
    }

    /// Clear
    public func clear() {
        context.resetBitmapContext()
        🐢.clear()
    }

    /// Run
    public func run() {
        context.resetBitmapContext()
        🐢.execute(context: context)
        if context.show {
            CommandDrawTortoise().execute(context: context)
        }
    }

    /// Run next command
    /// - returns: whether it has next
    // TODO:
    /*
    public func runNext() -> Bool {
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
        if context.show {
            CommandDrawTortoise().execute(context: context)
        }

        nextCommand += 1
        return true
    }
    */


    /// Drawn bitmap image
    public var renderedImage: CGImage? {
        // swiftlint:disable:previous variable_name
        return context.outputImage
    }




}
