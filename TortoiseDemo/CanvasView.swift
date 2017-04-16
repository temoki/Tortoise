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

    private var canvas: Canvas?

    var 🐢: Procedure? {
        return canvas?.🐢
    }

    func setup() {
        if canvas == nil {
            canvas = Canvas(width: self.bounds.width,
                            height: self.bounds.height,
                            tortoiseImage: #imageLiteral(resourceName: "Tortoise").cgImage)
        }
    }

    func clear() {
        canvas?.clear()
    }

    func drawAtOnce() {
        canvas?.drawingStep = .AtOnce
        canvas?.draw()
        setNeedsDisplay()
    }

    func drawOneByOne() {
        canvas?.drawingStep = .OneByOne
        canvas?.draw()
        setNeedsDisplay()
    }

    func draw() {
    }

    override func draw(_ rect: CGRect) {
        guard let canvas = self.canvas, let image = canvas.rendered else { return }
        guard let currencContext = UIGraphicsGetCurrentContext() else { return }
        currencContext.saveGState()
        currencContext.draw(image, in: self.bounds)
        currencContext.restoreGState()

        if canvas.drawingStep == .OneByOne {
            DispatchQueue.main.async { [weak self] in
                self?.canvas?.draw()
                self?.setNeedsDisplay()
            }
        }
    }

}
