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
        let pos = CGPoint(x: context.bitmapContext.currentPointOfPath.x,
                          y: y(Properties(context: context)))
        if context.penDown {
            context.bitmapContext.addLine(to: pos)
            context.bitmapContext.strokePath()
        }
        context.bitmapContext.move(to: pos)
    }

}
