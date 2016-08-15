//
//  CommandSetPenWidth.swift
//  Tortoise
//
//  Created by temoki on 2016/08/12.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandSetPenWidth: Command {

    private let width: NumberOutput

    init(_ width: NumberOutput) {
        self.width = width
    }

    func execute(context: Context) {
        context.penWidth = width.output(context: context)
        context.cgContext.setLineWidth(context.penWidth)
    }

}
