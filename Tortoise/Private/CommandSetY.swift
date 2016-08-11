//
//  CommandSetY.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

class CommandSetY: Command {

    let posY: Value

    init(y: Value) {
        self.posY = y
    }

    func execute(context: Context) {
        let posX = context.cgContext.currentPointOfPath.x
        if context.penDown {
            context.cgContext.addLineTo(x: posX, y: posY)
            context.cgContext.strokePath()
        }
        context.cgContext.moveTo(x: posX, y: posY)
    }

}
