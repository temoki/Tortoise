//
//  CommandSetRGB.swift
//  Tortoise
//
//  Created by temoki on 2016/08/12.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandSetRGB: Command {

    private let number: NumberOutput
    private let components: [NumberOutput]

    init(number: NumberOutput, components: [NumberOutput]) {
        self.number = number
        self.components = components
    }

    func execute(context: Context) {
        let number = self.number.output(context: context).integer
        let components = self.components.map { $0.output(context: context) }
        context.colorPalette.set(color: RGBColor(components: components), number: number)
    }

}
