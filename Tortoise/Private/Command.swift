//
//  Command.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import UIKit

/// Tortoise command
protocol Command {

    /// Execute this command
    func execute(context: Context)
    
}

class Forward: Command {
    
    private let value: Value
    
    init(value: Value) {
        self.value = value
    }
    
    func execute(context: Context) {
        context.cgContext.moveTo(x: context.posX, y: context.posY)
        context.posX += value * cos(context.heading)
        context.posY += value * sin(context.heading)
        context.cgContext.addLineTo(x: context.posX, y: context.posY)
        context.cgContext.strokePath()
    }

}

class Right: Command {
    
    private let value: Value
    
    init(value: Value) {
        self.value = value
    }
    
    func execute(context: Context) {
        context.heading -= value.radian
    }

}

class DrawTortoise: Command {
    
    func execute(context: Context) {
        let t = CGAffineTransform(translationX: context.posX, y: context.posY).rotate(context.heading)

        let p1 = CGPoint(x:  10, y:  0).apply(transform: t)
        let p2 = CGPoint(x: -10, y:  5).apply(transform: t)
        let p3 = CGPoint(x: -10, y: -5).apply(transform: t)
        
        context.cgContext.moveTo(x: p1.x, y: p1.y)
        context.cgContext.addLineTo(x: p2.x, y: p2.y)
        context.cgContext.addLineTo(x: p3.x, y: p3.y)
        context.cgContext.addLineTo(x: p1.x, y: p1.y)
        context.cgContext.fillPath()
    }
}
