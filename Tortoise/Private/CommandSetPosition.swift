//
//  CommandSetPosition.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandSetPosition: Command {

    private let x: NumberOutput
    private let y: NumberOutput

    init(x: NumberOutput, y: NumberOutput) {
        self.x = x
        self.y = y
    }

    func execute(context: Context) {
        let posX = x.output(context: context)
        let posY = y.output(context: context)
        if context.penDown {
            context.cgContext.addLineTo(x: posX, y: posY)
            context.cgContext.strokePath()
        }
        context.cgContext.moveTo(x: posX, y: posY)
    }

}
