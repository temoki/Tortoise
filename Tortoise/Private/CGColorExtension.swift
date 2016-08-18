//
//  CGColorExtension.swift
//  Tortoise
//
//  Created by temoki on 2016/08/16.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

extension CGColor {

    static let blackColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(),
                                    components: [0, 0, 0, 1])!
    // swiftlint:disable:previous force_unwrapping

    static let whiteColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(),
                                    components: [1, 1, 1, 1])!
    // swiftlint:disable:previous force_unwrapping

    static let clearColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(),
                                    components: [0, 0, 0, 0])!
    // swiftlint:disable:previous force_unwrapping

}
