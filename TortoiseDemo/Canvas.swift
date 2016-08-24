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
    var tortoise: Tortoise?

    private var animationMode = false

    func setup() {
        if self.tortoise == nil {
            self.tortoise = Tortoise(canvasWidth: self.bounds.width,
                                     canvasHeight: self.bounds.height,
                                     tortoiseImage: #imageLiteral(resourceName: "Tortoise").cgImage)
        }
    }

    func drawAtOnce() {
        guard let tortoise = self.tortoise else { return }
        animationMode = false
        tortoise.run()
        setNeedsDisplay()
    }

    func drawOneByOne() {
        // TODO:
        /*
        guard let tortoise = self.tortoise else { return }
        animationMode = true
        if 🐢.runNext() {
            self.setNeedsDisplay()
        }
        */
    }

    override func draw(_ rect: CGRect) {
        guard let image = tortoise?.renderedImage else { return }
        guard let currencContext = UIGraphicsGetCurrentContext() else { return }
        currencContext.draw(image, in: self.bounds)
        if animationMode {
            DispatchQueue.main.async { self.drawOneByOne() }
        }
    }

}
