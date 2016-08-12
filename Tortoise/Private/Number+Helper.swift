//
//  Number+Helper.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

extension Number {

    /// to radian
    var radian: Number {
        get { return self * .pi / 180 }
    }

    /// to degree
    var degree: Number {
        get { return self * 180 / .pi }
    }

    /// to integer
    var integer: Int {
        get { return Swift.max(Int(self), 0) }
    }

}
