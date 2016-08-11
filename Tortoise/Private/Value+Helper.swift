//
//  Value+Helper.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

extension Value {

    /// to radian
    var radian: Value {
        get { return self * .pi / 180 }
    }

    /// to degree
    var degree: Value {
        get { return self * 180 / .pi }
    }

    /// to number
    var number: Int {
        get { return Swift.max(Int(self), 0) }
    }

}
