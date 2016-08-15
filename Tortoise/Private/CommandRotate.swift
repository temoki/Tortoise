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
        context.heading += angle.output(context: context) * (right ? -1 : 1)
    }

}
