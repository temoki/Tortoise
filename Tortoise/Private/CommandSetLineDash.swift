//
//  CommandSetLineDash.swift
//  Tortoise
//
//  Created by temoki on 2016/08/22.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandSetLineDash: Command {

    let phase: NumberOutput
    let dashLengths: [NumberOutput]

    init(_ phase: NumberOutput, _ dashLengths: [NumberOutput]) {
        self.phase = phase
        self.dashLengths = dashLengths
    }

    func execute(context: Context) {
        let phase = self.phase(TortoiseProperties(context: context))
        let dashLengths = self.dashLengths.map { $0(TortoiseProperties(context: context)) }
        context.bitmapContext.setLineDash(phase: phase, lengths: dashLengths)
    }

}
