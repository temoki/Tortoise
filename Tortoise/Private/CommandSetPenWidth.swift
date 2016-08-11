//
//  CommandSetPenWidth.swift
//  Tortoise
//
//  Created by temoki on 2016/08/12.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandSetPenWidth: Command {

    let width: Value

    init(_ width: Value) {
        self.width = width
    }

    func execute(context: Context) {
        context.cgContext.setLineWidth(width)
    }

}
