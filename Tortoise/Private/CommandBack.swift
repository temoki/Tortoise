//
//  CommandBack.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

class CommandBack: Command {
    
    private let distance: Value
    
    init(distance: Value) {
        self.distance = distance
    }
    
    func execute(context: Context) {
        let t = CGAffineTransform(translationX: context.posX, y: context.posY).rotate(context.heading)
        
        let p1 = CGPoint.zero.apply(transform: t)
        let p2 = CGPoint(x: -distance, y: 0).apply(transform: t)
        
        context.cgContext.moveTo(x: p1.x, y: p1.y)
        context.cgContext.addLineTo(x: p2.x, y: p2.y)
        context.cgContext.strokePath()
        
        context.posX = p2.x
        context.posY = p2.y
    }
    
}
