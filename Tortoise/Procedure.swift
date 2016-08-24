//
//  Procedure.swift
//  Tortoise
//
//  Created by temoki on 2016/08/24.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

public class Procedure: Command {

    internal var commandList: [Command] = []

    internal var variables: [String: Number] = [:]

    internal func add(command: Command) {
        commandList.append(command)
    }

    internal func clear() {
        commandList.removeAll()
        variables.removeAll()
    }

    internal func execute(context: Context) {
        context.localVariablesStack.append(variables)
        commandList.forEach { (command) in
            command.execute(context: context)
        }
        context.localVariablesStack.removeLast()
    }

}
