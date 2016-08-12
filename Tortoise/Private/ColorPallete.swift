//
//  ColorPalette.swift
//  Tortoise
//
//  Created by temoki on 2016/08/11.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

class ColorPalette {

    // Material Design: Color Palette
    // https://material.google.com/style/color.html
    private class func defaultColors() -> [RGBColor] {
        let h: Value = 255
        return [
            RGBColor([255, 255, 255, 0], high: h),  // White
            RGBColor([0, 0, 0, 0], high: h),        // Black
            RGBColor([244, 67, 54, 0], high: h),    // Red
            RGBColor([233, 30, 99, 0], high: h),    // Pink
            RGBColor([156, 39, 176, 0], high: h),   // Purple
            RGBColor([103, 58, 183, 0], high: h),   // Deep Purple
            RGBColor([63, 81, 181, 0], high: h),    // Indigo
            RGBColor([33, 150, 243, 0], high: h),   // Blue
            RGBColor([3, 169, 244, 0], high: h),    // Light Blue
            RGBColor([0, 188, 212, 0], high: h),    // Cyan
            RGBColor([0, 150, 136, 0], high: h),    // Teal
            RGBColor([76, 175, 80, 0], high: h),    // Green
            RGBColor([139, 195, 74, 0], high: h),   // Light Green
            RGBColor([205, 220, 57, 0], high: h),   // Lime
            RGBColor([255, 235, 59, 0], high: h),   // Yellow
            RGBColor([255, 193, 7, 0], high: h),    // Amber
            RGBColor([255, 152, 0, 0], high: h),    // Orange
            RGBColor([255, 87, 34, 0], high: h),    // Deep Orange
            RGBColor([158, 158, 158, 0], high: h),  // Grey
            RGBColor([96, 123, 139, 0], high: h)    // Blue Grey
        ]
    }

    private var colors: [RGBColor] = ColorPalette.defaultColors()

    func color(number: Int) -> RGBColor {
        return colors[number % colors.count]
    }

    func set(color: RGBColor, number: Int) {
        colors[number % colors.count] = color
    }

    func reset() {
        colors = ColorPalette.defaultColors()
    }

}
