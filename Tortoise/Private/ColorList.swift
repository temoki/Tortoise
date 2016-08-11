//
//  ColorList.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class ColorList {

    private class func defaultColors() -> [RGBColor] {
        let h: Value = 255
        let a = h
        return [
            RGBColor([255, 255, 255, a], high: h),
            RGBColor([0, 0, 0, a], high: h),
            RGBColor([255, 43, 26, a], high: h),
            RGBColor([20, 61, 251, a], high: h),
            RGBColor([254, 250, 52, a], high: h),
            RGBColor([169, 121, 70, a], high: h),
            RGBColor([4, 252, 254, a], high: h)
        ]
    }

    private var colors: [RGBColor] = ColorList.defaultColors()

    func color(number: Int) -> RGBColor {
        return colors[number % colors.count]
    }

    func set(color: RGBColor, number: Int) {
        colors[number % colors.count] = color
    }

    func reset() {
        colors = ColorList.defaultColors()
    }

}
