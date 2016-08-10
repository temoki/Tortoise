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
    /// - parameter context: Context
    func execute(context: Context)
    
}

