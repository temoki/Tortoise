//
//  CommandSetPenColor.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandSetPenColor: Command {

    private let number: NumberOutput

    init(number: NumberOutput) {
        self.number = number
    }

    func execute(context: Context) {
        context.penColor = number.output(context: context).integer
        let color = context.colorPalette.color(number: context.penColor)
        context.bitmapContext.setStrokeColor(color.cgColor)
        context.bitmapContext.setFillColor(color.cgColor)
    }

}
