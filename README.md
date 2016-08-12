# Tortoise

Tortoise is turtle graphics engine for iOS. 

This project supports only Swift 3 and Xcode 8.

## Example

```swift
🐢.SetPenWidth(0.5).SetPenColor(3)
    .Repeat(400) {
        🐢.Repeat(34) {
            🐢.Forward(12).Right(10)
        }.Right(90)
    .Run()
```

<img src="https://github.com/temoki/Tortoise/blob/master/ReadmeImages/example.png" width="300" />

## Usage

* Instanciate `Tortoise` with `CGContext` instance and canvas size.

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
* `Arc`
* `PenDown`
* `PenUp`
* `SetPenColor`
* `SetPenWidth`
* `Repeat`
