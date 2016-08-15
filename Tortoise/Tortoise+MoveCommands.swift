//
//  Tortoise+MoveCommands.swift
//  Tortoise
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import Foundation

/// Tortoise move commands
public extension Tortoise {

    // MARK:- Forward

    /// Move the tortoise forward distance pixels.
    /// If the pen is down, a line is drawn.
    /// - parameter distance: Distance
    /// - returns: self
    public func Forward(_ distance: NumberOutput) -> Tortoise {
        add(command: CommandGo(distance: distance, back: false))
        return self
    }

    /// Move the tortoise forward distance pixels.
    /// If the pen is down, a line is drawn.
    /// - parameter distance: Distance
    /// - returns: self
    public func Forward(_ distance: Number) -> Tortoise {
        return Forward(.Value(distance))
    }


    // MARK:- Back

    /// Move the tortoise backwards distance pixels.
    /// Draws a line if the pen is down.
    /// - parameter distance: Distance
    /// - returns: self
    public func Back(_ distance: NumberOutput) -> Tortoise {
        add(command: CommandGo(distance: distance, back: true))
        return self
    }

    /// Move the tortoise backwards distance pixels.
    /// Draws a line if the pen is down.
    /// - parameter distance: Distance
    /// - returns: self
    public func Back(_ distance: Number) -> Tortoise {
        return Back(.Value(distance))
    }


    // MARK:- Right

    /// Rotate the tortoise clockwise through angle degrees.
    /// - parameter angle: Angle (degree)
    /// - returns: self
    public func Right(_ angle: NumberOutput) -> Tortoise {
        add(command: CommandRotate(angle: angle, right: true))
        return self
    }

    /// Rotate the tortoise clockwise through angle degrees.
    /// - parameter angle: Angle (degree)
    /// - returns: self
    public func Right(_ angle: Number) -> Tortoise {
        return Right(.Value(angle))
    }


    // MARK:- Left

    /// Rotate the tortoise anti-clockwise through angle degrees.
    /// - parameter angle: Angle (degree)
    /// - returns: self
    public func Left(_ angle: NumberOutput) -> Tortoise {
        add(command: CommandRotate(angle: angle))
        return self
    }

    /// Rotate the tortoise anti-clockwise through angle degrees.
    /// - parameter angle: Angle (degree)
    /// - returns: self
    public func Left(_ angle: Number) -> Tortoise {
        return Left(.Value(angle))
    }


    // MARK:- Home

    /// Move the tortoise to the middle of the screen (position [0 0])
    /// and set its heading to zero (pointing straight up).
    /// - returns: self
    public func Home() -> Tortoise {
        add(command: CommandHome())
        return self
    }


    // MARK:- SetHeading

    /// Set the tortoise heading to angle.
    /// The heading is the direction in which the tortoise is pointing.
    /// Straight up is a heading of zero.
    /// The heading increases as you go clockwise - straight down is 180.
    /// - parameter angle: Angle (degree)
    /// - returns: self
    public func SetHeading(_ angle: NumberOutput) -> Tortoise {
        add(command: CommandSetHeading(angle: angle))
        return self
    }

    /// Set the tortoise heading to angle.
    /// The heading is the direction in which the tortoise is pointing.
    /// Straight up is a heading of zero.
    /// The heading increases as you go clockwise - straight down is 180.
    /// - parameter angle: Angle (degree)
    /// - returns: self
    public func SetHeading(_ angle: Number) -> Tortoise {
        return SetHeading(.Value(angle))
    }


    // MARK:- SetPosition

    /// Move the tortoise to position x,y.
    /// If the pen is down, a line is drawn in the current colour.
    /// - parameter x: X coordinate
    /// - parameter y: Y coordinate
    /// - returns: self
    public func SetPosition(_ x: NumberOutput, _ y: NumberOutput) -> Tortoise {
        add(command: CommandSetPosition(x: x, y: y))
        return self
    }

    /// Move the tortoise to position x,y.
    /// If the pen is down, a line is drawn in the current colour.
    /// - parameter x: X coordinate
    /// - parameter y: Y coordinate
    /// - returns: self
    public func SetPosition(_ x: Number, _ y: Number) -> Tortoise {
        return SetPosition(.Value(x), .Value(y))
    }


    // MARK:- SetX

    /// Set the x-co-ordinate of the tortoise to x.
    /// Draws a line if the pen is down.
    /// - parameter x: X coordinate
    /// - returns: self
    public func SetX(_ x: NumberOutput) -> Tortoise {
        add(command: CommandSetX(x))
        return self
    }

    /// Set the x-co-ordinate of the tortoise to x.
    /// Draws a line if the pen is down.
    /// - parameter x: X coordinate
    /// - returns: self
    public func SetX(_ x: Number) -> Tortoise {
        return SetX(.Value(x))
    }


    // MARK:- SetY

    /// Set the y-co-ordinate of the tortoise to y.
    /// Draws a line if the pen is down.
    /// - parameter y: Y coordinate
    /// - returns: self
    public func SetY(_ y: NumberOutput) -> Tortoise {
        add(command: CommandSetY(y))
        return self
    }

    /// Set the y-co-ordinate of the tortoise to y.
    /// Draws a line if the pen is down.
    /// - parameter y: Y coordinate
    /// - returns: self
    public func SetY(_ y: Number) -> Tortoise {
        return SetY(.Value(y))
    }

}
