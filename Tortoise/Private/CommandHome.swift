//
//  CommandHome.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandHome: Command {

    func execute(context: Context) {
        context.home()
    }

}