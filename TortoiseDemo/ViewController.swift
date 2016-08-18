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

    @IBOutlet weak var canvas: Canvas!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        canvas.setup()
        canvas.drawAtOnce()
    }

    @IBAction func drawAtOnce(sender: UIButton) {
        commandTortoise()
        canvas.drawAtOnce()
    }

    @IBAction func drawOneByOne(sender: UIButton) {
        commandTortoise()
        canvas.drawOneByOne()
    }

    func commandTortoise() {
        guard let 🐢 = canvas.🐢 else { return }
        🐢.Clear()

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
            .Right(180)
            .Forward(150)
            .SetPenColor(1)
            .Done()
    }
}
