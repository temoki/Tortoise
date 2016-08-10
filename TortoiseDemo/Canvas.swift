//
//  MyCanvas.swift
//  TortoiseDemo
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import UIKit
import Tortoise

class Canvas: UIView {
    
    override func draw(_ rect: CGRect) {
        guard let cgContext = UIGraphicsGetCurrentContext() else { return }
        let 🐢 = Tortoise(cgContext: cgContext, canvasSize: self.bounds.size)
        🐢.Repeat(12) {
            🐢.Forward(100).Right(70)
        }.Run()
    }
    
}
