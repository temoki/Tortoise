//
//  CommandIf.swift
//  Tortoise
//
//  Created by temoki on 2016/08/27.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandIf: Command {

    let condition: BoolOutput
    let thenProcedure: Procedure
    let elseProcedure: Procedure

    init(condition: BoolOutput, thenProcedure: Procedure, elseProcedure: Procedure) {
        self.condition = condition
        self.thenProcedure = thenProcedure
        self.elseProcedure = elseProcedure
    }

    func execute(context: Context) throws {
        if condition(Properties(context: context)) {
            try thenProcedure.doExecute(context: context)
        } else {
            try elseProcedure.doExecute(context: context)
        }
    }

}
