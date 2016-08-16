//
//  CommandSetY.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandSetY: Command {

    private let y: NumberOutput

    init(_ y: NumberOutput) {
        self.y = y
    }

    func execute(context: Context) {
        let posX = context.bitmapContext.currentPointOfPath.x
        let posY = y.output(context: context)
        if context.penDown {
            context.bitmapContext.addLineTo(x: posX, y: posY)
            context.bitmapContext.strokePath()
        }
        context.bitmapContext.moveTo(x: posX, y: posY)
    }

}
