//
//  CommandForward.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandForward: Command {

    private let distance: Value

    init(distance: Value) {
        self.distance = distance
    }

    func execute(context: Context) {
        let pos = context.cgContext.currentPointOfPath
        let transform = CGAffineTransform(translationX: pos.x, y: pos.y)
            .rotate(context.heading.radian)
        let newPos = CGPoint(x: distance, y: 0).apply(transform: transform)
        if context.penDown {
            context.cgContext.addLineTo(x: newPos.x, y: newPos.y)
            context.cgContext.strokePath()
        }
        context.cgContext.moveTo(x: newPos.x, y: newPos.y)
    }

}
