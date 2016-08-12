//
//  CommandSetPosition.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandSetPosition: Command {

    private let posX: Number
    private let posY: Number

    init(x: Number, y: Number) {
        self.posX = x
        self.posY = y
    }

    func execute(context: Context) {
        if context.penDown {
            context.cgContext.addLineTo(x: posX, y: posY)
            context.cgContext.strokePath()
        }
        context.cgContext.moveTo(x: posX, y: posY)
    }

}
