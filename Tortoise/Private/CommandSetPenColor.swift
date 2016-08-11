//
//  CommandSetPenColor.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

class CommandSetPenColor: Command {

    let number: Int

    init(number: Int) {
        self.number = number
    }

    func execute(context: Context) {
        let color = context.colorPalette.color(number: self.number)
        context.cgContext.setStrokeColor(color.cgColor)
    }

}
