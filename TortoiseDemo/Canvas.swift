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

    private var animationMode = false

    func setup() {
        if self.🐢 == nil {
            self.🐢 = Tortoise(canvasWidth: self.bounds.width,
                                 canvasHeight: self.bounds.height,
                                 tortoiseImage: #imageLiteral(resourceName: "Tortoise").cgImage)
        }
    }

    func drawAtOnce() {
        guard let 🐢 = self.🐢 else { return }
        animationMode = false
        🐢.run()
        setNeedsDisplay()
    }

    func drawOneByOne() {
        guard let 🐢 = self.🐢 else { return }
        animationMode = true
        if 🐢.runNext() {
            self.setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        guard let image = 🐢?.renderedImage else { return }
        guard let currencContext = UIGraphicsGetCurrentContext() else { return }
        currencContext.draw(image, in: self.bounds)
        if animationMode {
            DispatchQueue.main.async { self.drawOneByOne() }
        }
    }

}
