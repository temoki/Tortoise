//
//  CommandSetRGB.swift
//  Tortoise
//
//  Created by temoki on 2016/08/12.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandSetRGB: Command {

    private let number: Int
    private let components: [Value]

    init(number: Int, components: [Value]) {
        self.number = number
        self.components = components
    }

    func execute(context: Context) {
        context.colorPalette.set(color: RGBColor(components), number: number)
    }

}
