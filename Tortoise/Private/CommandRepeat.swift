//
//  CommandRepeat.swift
//  Tortoise
//
//  Created by temoki on 2016/08/25.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandRepeat: Command {

    let number: NumberOutput
    let procedure: Procedure

    init(number: NumberOutput, procedure: Procedure) {
        self.number = number
        self.procedure = procedure
    }

    func execute(context: Context) throws {
        let times = self.number(Properties(context: context)).integer
        for _ in 0..<times {
            try procedure.doExecute(context: context)
        }
    }

}
