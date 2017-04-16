//
//  Command.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

/// Tortoise command
protocol Command {

    /// Execute this command
    func execute(context: Context) throws

}

enum CommandError: Error {
    case AllFinished
    case ShouldDiscontinue
}

extension Command {

    func doExecute(context: Context) throws {
        try execute(context: context)
        if context.shouldDiscontinueDrawing {
            throw CommandError.ShouldDiscontinue
        }
    }

}
