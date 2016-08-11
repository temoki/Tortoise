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
    /// - parameter number: Repeat times
    /// - parameter statements: Repeat statements
    /// - returns: self
    public func Repeat(_ times: Value, statements: (Void) -> Tortoise) -> Tortoise {
        for _ in 0 ..< times.number {
            let _ = statements()
        }
        return self
    }

    /// Run statements statements number times.
    /// - parameter number: Repeat times
    /// - parameter statements: Repeat statements (with repeat number)
    /// - returns: self
    public func RepeatN(_ times: Value, statements: (Value) -> Tortoise) -> Tortoise {
        for number in 0 ..< times.number {
            let _ = statements(Value(number))
        }
        return self
    }

}
