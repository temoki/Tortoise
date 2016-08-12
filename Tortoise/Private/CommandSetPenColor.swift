//
//  CommandSetPenColor.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandSetPenColor: Command {

    private let number: Int

    init(number: Int) {
        self.number = number
    }

    func execute(context: Context) {
        context.penColor = self.number
        let color = context.colorPalette.color(number: context.penColor)
        context.cgContext.setStrokeColor(color.cgColor)
        context.cgContext.setFillColor(color.cgColor)
    }

}
