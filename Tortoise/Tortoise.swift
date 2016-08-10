//
//  Tortoise.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation
import CoreGraphics

/// Tortoise
final public class Tortoise {
    
    /// Context
    private let context: Context

    /// Commands
    private var commands: [Command] = []

    /// Initializer
    /// - parameter context: Graphics context
    public required init(cgContext: CGContext) {
        context = Context(cgContext: cgContext)
    }

    /// Execute commands
    public func execute() {
        commands.append(DrawTortoise())
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
