//
//  Tortoise+Commands.swift
//  TortoiseDemo
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

/// Tortoise commands
public extension Tortoise {
    
    public func forward(_ value: Value) -> Tortoise {
        add(command: Forward(value: value))
        return self
    }
    
    public func right(_ value: Value) -> Tortoise {
        add(command: Right(value: value))
        return self
    }
    
}
