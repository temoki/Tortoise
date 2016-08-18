//
//  CommandHome.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

class CommandHome: Command {

    func execute(context: Context) {
        context.setPosition()
        context.setHeading()
    }

}
