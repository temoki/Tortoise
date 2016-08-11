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

        🐢.RepeatN(100) { (number) -> Tortoise in
            🐢.SetPenColor(number).Forward(100).Right(85)
        }.Run()
    }

}
