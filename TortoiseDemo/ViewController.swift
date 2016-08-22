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
        let image = UIImage(named: "Tortoise")
        print(image)
    }

    @IBAction func clear(sender: UIButton) {
        canvas.🐢?.clearAllCommands()
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
        🐢.clearAllCommands()

        🐢.ClearScreen()
            .Make("color", 0)
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
                    .Make("color", { $0["color"] + 1 })
                    .Print({ $0["color"] })
                    .SetPenColor({ $0["color"] })
                    .Forward(20)
                    .Right(60)
                }
            }
            .Done()
    }

}
