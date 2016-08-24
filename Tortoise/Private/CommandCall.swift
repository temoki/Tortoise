//
//  CommandCall.swift
//  Tortoise
//
//  Created by temoki on 2016/08/25.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandCall: Command {

    let name: String
    let arguments: [String: NumberOutput]

    init(name: String, arguments: [String: NumberOutput]) {
        self.name = name
        self.arguments = arguments
    }

    func execute(context: Context) {
        guard let procedure = context.procedures[name] else { return }
        let properties = Properties(context: context)
        arguments.forEach { (argument) in
            procedure.variables[argument.key] = argument.value(properties)
        }
        procedure.execute(context: context)
    }


}
