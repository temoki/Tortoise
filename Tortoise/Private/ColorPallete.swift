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
            RGBColor(components: [255, 255, 255], high: h),  // White
            RGBColor(components: [0, 0, 0], high: h),        // Black
            RGBColor(components: [244, 67, 54], high: h),    // Red
            RGBColor(components: [233, 30, 99], high: h),    // Pink
            RGBColor(components: [156, 39, 176], high: h),   // Purple
            RGBColor(components: [103, 58, 183], high: h),   // Deep Purple
            RGBColor(components: [63, 81, 181], high: h),    // Indigo
            RGBColor(components: [33, 150, 243], high: h),   // Blue
            RGBColor(components: [3, 169, 244], high: h),    // Light Blue
            RGBColor(components: [0, 188, 212], high: h),    // Cyan
            RGBColor(components: [0, 150, 136], high: h),    // Teal
            RGBColor(components: [76, 175, 80], high: h),    // Green
            RGBColor(components: [139, 195, 74], high: h),   // Light Green
            RGBColor(components: [205, 220, 57], high: h),   // Lime
            RGBColor(components: [255, 235, 59], high: h),   // Yellow
            RGBColor(components: [255, 193, 7], high: h),    // Amber
            RGBColor(components: [255, 152, 0], high: h),    // Orange
            RGBColor(components: [255, 87, 34], high: h),    // Deep Orange
            RGBColor(components: [158, 158, 158], high: h),  // Grey
            RGBColor(components: [96, 123, 139], high: h)    // Blue Grey
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
