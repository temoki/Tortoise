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
        let a = h
        return [
            RGBColor([255, 255, 255, a], high: h),  // White
            RGBColor([0, 0, 0, a], high: h),        // Black
            RGBColor([244, 67, 54, a], high: h),    // Red
            RGBColor([233, 30, 99, a], high: h),    // Pink
            RGBColor([156, 39, 176, a], high: h),   // Purple
            RGBColor([103, 58, 183, a], high: h),   // Deep Purple
            RGBColor([63, 81, 181, a], high: h),    // Indigo
            RGBColor([33, 150, 243, a], high: h),   // Blue
            RGBColor([3, 169, 244, a], high: h),    // Light Blue
            RGBColor([0, 188, 212, a], high: h),    // Cyan
            RGBColor([0, 150, 136, a], high: h),    // Teal
            RGBColor([76, 175, 80, a], high: h),    // Green
            RGBColor([139, 195, 74, a], high: h),   // Light Green
            RGBColor([205, 220, 57, a], high: h),   // Lime
            RGBColor([255, 235, 59, a], high: h),   // Yellow
            RGBColor([255, 193, 7, a], high: h),    // Amber
            RGBColor([255, 152, 0, a], high: h),    // Orange
            RGBColor([255, 87, 34, a], high: h),    // Deep Orange
            RGBColor([158, 158, 158, a], high: h),  // Grey
            RGBColor([96, 123, 139, a], high: h)    // Blue Grey
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
