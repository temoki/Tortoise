//
//  CommandRotate.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandRotate: Command {

    private let angle: Number

    init(angle: Number) {
        self.angle = angle
    }

    func execute(context: Context) {
        context.heading += angle
    }

}
