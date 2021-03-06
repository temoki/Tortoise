//
//  MultiCommand.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class MultiCommand: Command {

    let commands: [Command]

    init(commands: [Command]) {
        self.commands = commands
    }

    func execute(context: Context) {
        self.commands.forEach { (command) in
            command.execute(context: context)
        }
    }

}
