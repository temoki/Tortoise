//
//  CommandGo.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandGo: Command {

    private let distance: NumberOutput
    private let back: Bool

    init(distance: NumberOutput, back: Bool = false) {
        self.distance = distance
        self.back = back
    }

    func execute(context: Context) {
        let pos = context.bitmapContext.currentPointOfPath
        let transform = CGAffineTransform(translationX: pos.x, y: pos.y)
            .rotate(context.heading.radian)
        let x = distance.output(context: context) * (back ? -1 : 1)
        let newPos = CGPoint(x: x, y: 0).apply(transform: transform)
        if context.penDown {
            context.bitmapContext.addLineTo(x: newPos.x, y: newPos.y)
            context.bitmapContext.strokePath()
        }
        context.bitmapContext.moveTo(x: newPos.x, y: newPos.y)
    }

}
