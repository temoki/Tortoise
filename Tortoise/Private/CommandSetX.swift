//
//  CommandSetX.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandSetX: Command {

    private let x: NumberOutput

    init(_ x: NumberOutput) {
        self.x = x
    }

    func execute(context: Context) {
        let posX = x.output(context: context)
        let posY = context.bitmapContext.currentPointOfPath.y
        if context.penDown {
            context.bitmapContext.addLineTo(x: posX, y: posY)
            context.bitmapContext.strokePath()
        }
        context.bitmapContext.moveTo(x: posX, y: posY)
    }

}
