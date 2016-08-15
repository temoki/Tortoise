# Tortoise

Tortoise is a turtle graphics engine for iOS.

This project supports only Swift 3 and Xcode 8.

## Example

```swift
🐢.SetRGB(0, [0.8, 0.8, 0.8])
    .Repeat(12) { 🐢
        .SetPenWidth(2)
        .Right(15)
        .Repeat(6) { 🐢
            .SetPenColor(.PenColor({ $0 + 1 }))
            .Forward(50)
            .Right(60)
        }
        .SetPenWidth(1)
        .Right(15)
        .Repeat(6) { 🐢
            .SetPenColor(.PenColor({ $0 + 1 }))
            .Forward(20)
            .Right(60)
        }
    }
    .SetPenWidth(3)
    .SetPenColor(0)
    .Back(150)
    .SetPenColor(1)
    .Run()
```

<img src="https://github.com/temoki/Tortoise/blob/master/ReadmeImages/example.png" width="300" />

## Usage

* Instantiate `Tortoise` with `CGContext` instance and canvas size.

```swift
class Canvas: UIView {
    override func draw(_ rect: CGRect) {
        let 🐢 = Tortoise(cgContext: UIGraphicsGetCurrentContext()!,
                          canvasWidth: self.bounds.size.width,
                          canvasHeight: self.bounds.size.height)

        // Command 🐢 to draw.
    }
}
```

## Commands

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
* `PenDown`
* `PenUp`
* `SetPenColor`
* `SetPenWidth`
* `SetRGB`
* `Random`
* `Heading`
* `Position`
* `PenColor`
* `PenWidth`
* `CanvasSize`
* `Repeat`
