//
//  CommandClean.swift
//  Tortoise
//
//  Created by temoki on 2016/08/21.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandClean: Command {

    func execute(context: Context) throws {
        context.clearScreen()
    }

}
