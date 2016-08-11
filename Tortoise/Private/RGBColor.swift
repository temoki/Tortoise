//
//  RGBColor.swift
//  TortoiseDemo
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class RGBColor {

    private static let colorSpace = CGColorSpaceCreateDeviceRGB()

    // swiftlint:disable:next force_unwrapping
    private static let blackColor = CGColor(colorSpace: colorSpace, components: [0, 0, 0, 1])!

    let r: Value
    let g: Value
    let b: Value
    let a: Value

    let cgColor: CGColor

    init(r: Value, g: Value, b: Value, a: Value = 1, high: Value = 1) {
        self.r = min(max(r/high, 0), 1)
        self.g = min(max(g/high, 0), 1)
        self.b = min(max(b/high, 0), 1)
        self.a = min(max(a/high, 0), 1)

        let components = [self.r, self.g, self.b, self.a]
        let cgColor = CGColor(colorSpace: RGBColor.colorSpace, components: components)
        self.cgColor =  cgColor ?? RGBColor.blackColor
    }

    convenience init(_ components: [CGFloat], high: Value = 1) {
        var reversedComponents = Array(components.reversed())
        let r = reversedComponents.popLast() ?? 0
        let g = reversedComponents.popLast() ?? 0
        let b = reversedComponents.popLast() ?? 0
        let a = reversedComponents.popLast() ?? 1
        self.init(r: r, g: g, b: b, a: a, high: high)

    }

}
