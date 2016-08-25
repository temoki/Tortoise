//
//  CommandDrawTortoise.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation
import CoreGraphics

class CommandDrawTortoise: Command {

    func execute(context: Context) {
        context.bitmapContext.saveGState()

        if let image = context.tortoiseImage {
            // Draw tortoise image
            let imageSize = CGSize(width: image.width, height: image.height)
            let drawRect = CGRect(origin: CGPoint.zero, size: imageSize)
            context.bitmapContext.translateBy(x: context.position.x, y: context.position.y)
            context.bitmapContext.rotate(by: (context.heading-Context.defaultHeading).radian)
            context.bitmapContext.translateBy(x: -imageSize.width*0.5, y: -imageSize.height*0.5)
            context.bitmapContext.draw(image, in: drawRect)

        } else {
            // Dras triangle's 3 points.
            let transform = CGAffineTransform(translationX: context.position.x,
                                              y: context.position.y)
                .rotated(by: context.heading.radian)
            let pos1 = CGPoint(x:  10, y:  0).applying(transform)
            let pos2 = CGPoint(x: -10, y:  5).applying(transform)
            let pos3 = CGPoint(x: -10, y: -5).applying(transform)

            context.bitmapContext.move(to: pos1)
            context.bitmapContext.addLine(to: pos2)
            context.bitmapContext.addLine(to: pos3)
            context.bitmapContext.closePath()
            context.bitmapContext.fillPath()
        }

        context.bitmapContext.restoreGState()
    }

}
