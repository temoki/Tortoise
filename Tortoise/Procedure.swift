//
//  Procedure.swift
//  Tortoise
//
//  Created by temoki on 2016/08/24.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

public class Procedure: Command {

    var commandList: [Command] = []

    var variables: [String: Number] = [:]

    func add(command: Command) {
        commandList.append(command)
    }

    func clear() {
        commandList.removeAll()
        variables.removeAll()
    }

    func execute(context: Context) throws {
        context.variablesStack.append(variables)
        try commandList.forEach { (command) in
            try command.doExecute(context: context)
        }
        context.variablesStack.removeLast()
    }

}
