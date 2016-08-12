//
//  Canvas.swift
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
        let 🐢 = Tortoise(cgContext: cgContext,
                            canvasWidth: self.bounds.size.width,
                            canvasHeight: self.bounds.size.height)

        🐢.SetPenWidth(10).Dot(100, 100).Run()

        /*
        🐢.SetPenWidth(0.5)
            .SetPenColor(3)
            .Repeat(400) {
                🐢.Repeat(34) {
                    🐢.Forward(12).Right(10)}.Right(90)
            }.Run()
         */

    }

}
