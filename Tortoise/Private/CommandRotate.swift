//
//  CommandRotate.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandRotate: Command {

    private let angle: NumberOutput
    private let right: Bool

    init(angle: NumberOutput, right: Bool = false) {
        self.angle = angle
        self.right = right
    }

    func execute(context: Context) {
        let angle = self.angle(TortoiseProperties(context: context))
        context.setHeading(context.heading + angle * (right ? -1 : 1))
    }

}
