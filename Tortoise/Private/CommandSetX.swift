//
//  CommandSetX.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandSetX: Command {

    private let posX: Number

    init(_ x: Number) {
        self.posX = x
    }

    func execute(context: Context) {
        let posY = context.cgContext.currentPointOfPath.y
        if context.penDown {
            context.cgContext.addLineTo(x: posX, y: posY)
            context.cgContext.strokePath()
        }
        context.cgContext.moveTo(x: posX, y: posY)
    }

}
