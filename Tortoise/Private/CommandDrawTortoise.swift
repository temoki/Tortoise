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
        // Define triangle's 3 points.
        let pos = context.bitmapContext.currentPointOfPath
        let transform = CGAffineTransform(translationX: pos.x, y: pos.y)
            .rotate(context.heading.radian)
        let pos1 = CGPoint(x:  10, y:  0).apply(transform: transform)
        let pos2 = CGPoint(x: -10, y:  5).apply(transform: transform)
        let pos3 = CGPoint(x: -10, y: -5).apply(transform: transform)

        // Draw
        context.bitmapContext.moveTo(x: pos1.x, y: pos1.y)
        context.bitmapContext.addLineTo(x: pos2.x, y: pos2.y)
        context.bitmapContext.addLineTo(x: pos3.x, y: pos3.y)
        context.bitmapContext.closePath()
        context.bitmapContext.fillPath()

        // Back to current point
        context.bitmapContext.moveTo(x: pos.x, y: pos.y)
    }

}
