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
        let pos = CGPoint(x: x.output(context: context),
                          y: context.bitmapContext.currentPointOfPath.y)
        if context.penDown {
            context.bitmapContext.addLine(to: pos)
            context.bitmapContext.strokePath()
        }
        context.bitmapContext.move(to: pos)
    }

}
