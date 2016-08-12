//
//  CommandDot.swift
//  Tortoise
//
//  Created by temoki on 2016/08/12.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandDot: Command {

    private let posX: Number
    private let posY: Number

    init(x: Number, y: Number) {
        self.posX = x
        self.posY = y
    }

    func execute(context: Context) {
        if context.penDown {
            let dotRect = CGRect(x: posX - (context.penWidth / 2),
                                 y: posY - (context.penWidth / 2),
                                 width: context.penWidth,
                                 height: context.penWidth)
            context.cgContext.fill(dotRect)
        }
    }

}
