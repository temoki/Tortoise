//
//  MyCanvas.swift
//  TortoiseDemo
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import UIKit
import Tortoise

class MyCanvas: Canvas {
    
    override func draw(withTortoise tortoise: Tortoise) {
        tortoise
            .forward(50)
            .right(90)
            .forward(50)
            .right(90)
            .forward(50)
            .execute()
    }
    
}
