//
//  CommandLeft.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandLeft: Command {

    private let angle: NumberOutput

    func angleOutput(context: Context) -> Number {
        return angle(TortoiseProperties(context: context))
    }

    init(angle: NumberOutput) {
        self.angle = angle
    }

    func execute(context: Context) {
        context.setHeading(context.heading + angleOutput(context: context))
    }

}
