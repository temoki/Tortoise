//
//  ViewController.swift
//  TortoiseDemo
//
//  Created by temoki on 2016/08/10.
//  Copyright © 2016 temoki. All rights reserved.
//

import UIKit
import Tortoise

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: CanvasView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        canvasView.setup()
        canvasView.draw()
    }

    @IBAction func clear(sender: UIButton) {
        canvasView.clear()
        canvasView.drawAtOnce()
    }

    @IBAction func drawAtOnce(sender: UIButton) {
        canvasView.clear()
        commandTortoise()
        canvasView.drawAtOnce()
    }

    @IBAction func drawOneByOne(sender: UIButton) {
        canvasView.clear()
        commandTortoise()
        canvasView.drawOneByOne()
    }

    func commandTortoise() {
        guard let 🐢 = canvasView.🐢 else { return }

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

    }
}
