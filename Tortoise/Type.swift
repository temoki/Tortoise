//
//  Type.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import CoreGraphics

/// Number type in the Tortoise's world
public typealias Number = CGFloat

/// Number output closure by tortoise properties
public typealias NumberOutput = (Properties) -> Number

/// Boolean output closure by tortoise properties
public typealias BoolOutput = (Properties) -> Bool

/// Line Cap Style
public typealias LineCap = CGLineCap
