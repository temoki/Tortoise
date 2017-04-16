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

    func execute(context: Context) throws {
        let pos = CGPoint(x: x(Properties(context: context)),
                          y: y(Properties(context: context)))
        if context.penDown {
            context.bitmapContext.addLine(to: pos)
            context.bitmapContext.strokePath()
        }
        context.bitmapContext.move(to: pos)
    }

}
