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

    func execute(context: Context) throws {
        let angle = self.angle(Properties(context: context))
        context.heading = Context.defaultHeading - angle
    }

}
