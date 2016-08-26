# Tortoise

A turtle graphics engine for iOS written in Swift.

This is now developing with Swift 3 and Xcode 8 beta 6.

## Example

```swift
🐢.ClearScreen()
    .Define("Hexagon", ["length"]) { $0
        .Repeat(6) { $0
            .Forward({ $0["length"] })
            .Right(60)
        }
    }
    .Make("count", 12)
    .Repeat({ $0["count"] }) { $0
        .SetPenColor({ $0.PenColor + 1 })
        .Right(15)
        .SetPenWidth(2)
        .Call("Hexagon", ["length": 50])
        .Right(15)
        .SetPenWidth(1)
        .Call("Hexagon", ["length": 20])
    }
    .Done()
```

<img src="https://github.com/temoki/Tortoise/blob/master/ReadmeImages/example.png" width="300" /> <img src="https://github.com/temoki/Tortoise/blob/master/ReadmeImages/example.gif" width="300" />


## Usage

```swift
// Instantiate 🐢's canvas.
let canvas = Canvas(width: 300, height: 300)

// Command 🐢 to draw.
canvas.🐢.Right(90).Forward(100).Done()

// Draw canvas.
canvas.draw()

// Get rendered `CGImage`.
let image = canvas.rendered
```

## Commands

### Move and Draw

* `CleanScreen`
* `Clean`
* `Forward`
* `Back`
* `Right`
* `Left`
* `Home`
* `SetHeading`
* `SetPosition`
* `SetX`
* `SetY`
* `Dot`
* `Arc`

### Pen and Canvas state

* `PenDown`
* `PenUp`
* `SetPenColor`
* `SetPenWidth`
* `SetLineCap`
* `SetLineDash`
* `SetBackground`
* `SetRGB`

### Output

* `Random`
* `Towards`
* `Shown`
* `Heading`
* `Position`
* `PenColor`
* `PenWidth`
* `Background`
* `RGB`
* `CanvasSize`

### Control

* `Repeat`
* `ShowTortoise`
* `HideTortoise`
* `Define` (Procedure support)
* `Call` (Procedure support)
* `Make` (Variable support)
* `Local` (Variable support)
* `Print`

## Requirements

* Swift 3 (Xcode 8 beta 6)
* iOS 10.0 beta

## Installation

T.B.D.

## Roadmap

* `If`, `While`, `For` statement support
* Short-style commands (`Fd`, `Rt`, ...)
* Canvas view component
* `SetCanvasSize` command
* SPM/Carthage/Cocoapods installation
* macOS support
