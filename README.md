# Tortoise

A turtle graphics engine for iOS written in Swift.

This is now developing with Swift 3 and Xcode 8 beta 6.

## Example

```swift
🐢.SetRGB(0, [0.8, 0.8, 0.8])
    .Repeat(12) { 🐢
        .SetPenWidth(2)
        .Right(15)
        .Repeat(6) { 🐢
            .SetPenColor({ $0.PenColor + 1 })
            .Forward(50)
            .Right(60)
        }
        .SetPenWidth(1)
        .Right(15)
        .Repeat(6) { 🐢
            .SetPenColor({ $0.PenColor + 1 })
            .Forward(20)
            .Right(60)
        }
    }
    .Home()
    .Run()
```

<img src="https://github.com/temoki/Tortoise/blob/master/ReadmeImages/example.png" width="300" /> <img src="https://github.com/temoki/Tortoise/blob/master/ReadmeImages/example.gif" width="300" />


## Usage

```swift
// Instantiate 🐢 with canvas size.
let 🐢 = Tortoise(canvasWidth: 300, canvasHeight: 300)

// Command 🐢 to draw.
🐢.Forward(100).Done()

// Run and render.
🐢.Run()

// Get rendered image.
let image = 🐢.image
```

## Commands

### Move and Draw

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
* `SetRGB`

### Output

* `Random`
* `Towards`
* `Shown`
* `Heading`
* `Position`
* `PenColor`
* `PenWidth`
* `RGB`
* `CanvasSize`

### Control

* `Repeat`
* `ShowTortoise`
* `HideTortoise`

## Requirements

* Swift 3 (Xcode 8 beta 6)
* iOS 10.0 beta

## Installation

T.B.D.

## Roadmap

* `SetBackground`, `Background` command
* `CleanScreen`, `Clean` command
* `SetLineCap`, `SetLineDash` command
* `SetCanvasSize` command
* `If`, `While`, `For` statement support
* Variable support
* Procedure support
* `Canvas` view
* SPM/Carthage/Cocoapods installation
* macOS support
