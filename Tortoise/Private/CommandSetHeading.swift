//
//  CommandSetHeading.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandSetHeading: Command {

    private let angle: Number

    init(angle: Number) {
        self.angle = angle
    }

    func execute(context: Context) {
        context.heading = Context.defaultHeading - angle
    }

}
