//
//  CommandRepeat.swift
//  Tortoise
//
//  Created by temoki on 2016/08/25.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class CommandRepeat: Command {

    let procedure: Procedure
    let times: Int

    init(procedure: Procedure, times: Int) {
        self.procedure = procedure
        self.times = times
    }

    func execute(context: Context) {
        for _ in 0..<times {
            procedure.execute(context: context)
        }
    }

}
