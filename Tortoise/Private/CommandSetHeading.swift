//
//  CommandSetHeading.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandSetHeading: Command {

    private let angle: NumberOutput

    init(angle: NumberOutput) {
        self.angle = angle
    }

    func execute(context: Context) {
        let angle = self.angle(TortoiseProperties(context: context))
        context.setHeading(Context.defaultHeading - angle)
    }

}
