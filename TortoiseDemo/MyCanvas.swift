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
    
    override func draw(withTortoise 🐢: Tortoise) {
        🐢.Repeat(100) {
                🐢.Forward(100)
                    .Right(70)
            }.Execute()
    }
    
}
