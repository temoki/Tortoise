//
//  Tortoise+ControlCommands.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

/// Tortoise control commands
public extension Tortoise {

    /// Run statements statements number times.
    public func Repeat(_ number: Value, statements: (Void) -> Tortoise) -> Tortoise {
        for _ in 0 ..< Int(number) {
            let _ = statements()
        }
        return self
    }

}
