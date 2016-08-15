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
        let h: Number = 255
        return [
            RGBColor(components: [255, 255, 255], high: h),  //  0: White
            RGBColor(components: [0, 0, 0], high: h),        //  1: Black
            RGBColor(components: [244, 67, 54], high: h),    //  2: Red
            RGBColor(components: [233, 30, 99], high: h),    //  3: Pink
            RGBColor(components: [156, 39, 176], high: h),   //  4: Purple
            RGBColor(components: [103, 58, 183], high: h),   //  5: Deep Purple
            RGBColor(components: [63, 81, 181], high: h),    //  6: Indigo
            RGBColor(components: [33, 150, 243], high: h),   //  7: Blue
            RGBColor(components: [3, 169, 244], high: h),    //  8: Light Blue
            RGBColor(components: [0, 188, 212], high: h),    //  9: Cyan
            RGBColor(components: [0, 150, 136], high: h),    // 10: Teal
            RGBColor(components: [76, 175, 80], high: h),    // 11: Green
            RGBColor(components: [139, 195, 74], high: h),   // 12: Light Green
            RGBColor(components: [205, 220, 57], high: h),   // 13: Lime
            RGBColor(components: [255, 235, 59], high: h),   // 14: Yellow
            RGBColor(components: [255, 193, 7], high: h),    // 15: Amber
            RGBColor(components: [255, 152, 0], high: h),    // 16: Orange
            RGBColor(components: [255, 87, 34], high: h),    // 17: Deep Orange
            RGBColor(components: [158, 158, 158], high: h),  // 18: Grey
            RGBColor(components: [96, 123, 139], high: h)    // 19: Blue Grey
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
