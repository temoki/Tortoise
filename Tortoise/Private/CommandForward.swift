//
//  CommandForward.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandForward: Command {

    private let distance: NumberOutput

    func distanceOutput(context: Context) -> Number {
        return distance(TortoiseProperties(context: context))
    }

    init(distance: NumberOutput) {
        self.distance = distance
    }

    func execute(context: Context) {
        let transform = CGAffineTransform(translationX: context.posX, y: context.posY)
            .rotated(by: context.heading.radian)
        let newPos = CGPoint(x: distanceOutput(context: context), y: 0).applying(transform)
        if context.penDown {
            context.bitmapContext.addLine(to: newPos)
            context.bitmapContext.strokePath()
        }
        context.setPosition(newPos.x, newPos.y)
    }

}
