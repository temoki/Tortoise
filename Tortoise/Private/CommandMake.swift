//
//  CommandMake.swift
//  Tortoise
//
//  Created by temoki on 2016/08/22.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandMake: Command {

    let variableName: String
    let number: NumberOutput

    init(variableName: String, number: NumberOutput) {
        self.variableName = variableName
        self.number = number
    }

    func execute(context: Context) {
        context.globalVariables[variableName] = number(Properties(context: context))
    }

}
