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
        🐢.Repeat(12) { 🐢.Repeat(4) { 🐢.Forward(50).Right(90) }.Forward(10).Right(30) }.Run()
    }
    
}
