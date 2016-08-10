//
//  Tortoise+PenCommands.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

/// Tortoise pen commands
public extension Tortoise {

    /// Put the pen into draw state.
    /// If the tortoise moves, it will draw a line.
    public func PenDown() -> Tortoise {
        add(command: CommandPenDown(true))
        return self
    }

    /// Put the pen into non-draw state.
    public func PenUp() -> Tortoise {
        add(command: CommandPenDown(false))
        return self
    }

}
