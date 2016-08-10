//
//  Tortoise+Commands.swift
//  TortoiseDemo
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

/// Tortoise drawing commands
public extension Tortoise {
    
    public func Forward(_ value: Value) -> Tortoise {
        add(command: ForwardCommand(value: value))
        return self
    }
    
    public func Right(_ value: Value) -> Tortoise {
        add(command: RightCommand(value: value))
        return self
    }
    
}

/// Tortoise control commands
public extension Tortoise {
    
    public func Repeat(_ value: Value, handler: (Void) -> Tortoise) -> Tortoise {
        let repeatTimes = Int(value)
        for _ in 0 ..< repeatTimes {
            let _ = handler()
        }
        return self
    }
    
}
