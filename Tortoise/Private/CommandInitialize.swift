//
//  CommandInitialize.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandInitialize: Command {

    func execute(context: Context) {
        // Convert origin
        context.cgContext.translate(x: 0, y: context.canvasSize.height)
        context.cgContext.scale(x: 1, y: -1)
        context.cgContext.translate(x: context.canvasSize.width*0.5,
                                    y: context.canvasSize.height*0.5)

        // Move to origin
        context.cgContext.moveTo(x: 0, y: 0)
    }

}
