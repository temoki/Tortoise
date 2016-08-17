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
            .rotated(by: context.heading.radian)
        let pos1 = CGPoint(x:  10, y:  0).applying(transform)
        let pos2 = CGPoint(x: -10, y:  5).applying(transform)
        let pos3 = CGPoint(x: -10, y: -5).applying(transform)

        // Draw
        context.bitmapContext.move(to: pos1)
        context.bitmapContext.addLine(to: pos2)
        context.bitmapContext.addLine(to: pos3)
        context.bitmapContext.closePath()
        context.bitmapContext.fillPath()

        // Back to current point
        context.bitmapContext.move(to: pos)
    }

}
