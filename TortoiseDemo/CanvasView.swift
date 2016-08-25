//
//  CanvasView.swift
//  TortoiseDemo
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import UIKit
import Tortoise

class CanvasView: UIView {

    var canvas: Canvas?

    func setup() {
        if canvas == nil {
            canvas = Canvas(width: self.bounds.width,
                            height: self.bounds.height,
                            tortoiseImage: #imageLiteral(resourceName: "Tortoise").cgImage)
        }
    }

    func drawAtOnce() {
        guard let canvas = self.canvas else { return }
        canvas.draw()
        setNeedsDisplay()
    }

    func drawOneByOne() {
        // TODO:
    }

    override func draw(_ rect: CGRect) {
        guard let image = canvas?.rendered else { return }
        guard let currencContext = UIGraphicsGetCurrentContext() else { return }
        currencContext.saveGState()
        currencContext.draw(image, in: self.bounds)
        currencContext.restoreGState()
    }

}
