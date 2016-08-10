//
//  CommandDrawTortoise.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandDrawTortoise: Command {
    
    func execute(context: Context) {
        let t = CGAffineTransform(translationX: context.pos.x, y: context.pos.y).rotate(context.heading)
        
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
