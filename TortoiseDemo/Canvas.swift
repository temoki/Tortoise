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

    // swiftlint:disable:next variable_name
    var 🐢: Tortoise?

    func draw() {
        if self.🐢 == nil {
            self.🐢 = Tortoise(canvasWidth: self.bounds.width,
                                 canvasHeight: self.bounds.height)
        }
        guard let 🐢 = self.🐢 else { return }

        🐢.SetRGB(0, [0.8, 0.8, 0.8])
            .Repeat(12) { 🐢
                .SetPenWidth(2)
                .Right(15)
                .Repeat(6) { 🐢
                    .SetPenColor(.PenColor({ $0 + 1 }))
                    .Forward(50)
                    .Right(60)
                }
                .SetPenWidth(1)
                .Right(15)
                .Repeat(6) { 🐢
                    .SetPenColor(.PenColor({ $0 + 1 }))
                    .Forward(20)
                    .Right(60)
                }
            }
            .SetPenWidth(3)
            .SetPenColor(0)
            .Back(150)
            .SetPenColor(1)
            .Run()

        setNeedsDisplay()
    }

    override func draw(_ rect: CGRect) {
        guard let image = 🐢?.Image else { return }
        guard let currencContext = UIGraphicsGetCurrentContext() else { return }
        currencContext.draw(in: self.bounds, image: image)
    }

}
