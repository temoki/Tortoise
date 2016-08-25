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
        canvasView.drawAtOnce()
    }

    @IBAction func clear(sender: UIButton) {
        canvasView.canvas?.clear()
        canvasView.drawAtOnce()
    }

    @IBAction func drawAtOnce(sender: UIButton) {
        canvasView.canvas?.clear()
        commandTortoise()
        canvasView.drawAtOnce()
    }

    @IBAction func drawOneByOne(sender: UIButton) {
        canvasView.canvas?.clear()
        commandTortoise()
        canvasView.drawOneByOne()
    }

    func commandTortoise() {
        guard let canvas = canvasView.canvas else { return }
        canvas.🐢
            .ClearScreen()
            .Make("count", 3)
            .Define("Triangle", ["length"]) { $0
                .Local("angle", 120)
                .Repeat({ $0["count"] }) { $0
                    .Forward({ $0["length"] })
                    .Right({ $0["angle"] })
                }
            }
            .Repeat(10) { $0
                .Right({ $0.Random(45) })
                .Call("Triangle", ["length": 200])
            }
            .Done()
    }

}
