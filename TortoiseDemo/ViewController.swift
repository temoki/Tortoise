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
        canvas.tortoise?.clear()
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
        guard let tortoise = canvas.tortoise else { return }
        tortoise.clear()

        tortoise.🐢
            .ClearScreen()
            .Define("Triangle", ["length"]) { $0
                .Repeat(3) { $0
                    .Forward({ $0["length"] })
                    .Right(120)
                }
        }.Call("Triangle", ["length": 30]).Done()
        // TODO:
        /*
        tortoise.🐢.ClearScreen()
            .Define("Hoge", ["penColor"]) { $0
                .SetPenColor({ $0["penColor"] + 1 })
                .Forward(50)
                .Right(60)
            }
            .Make("color", 0)
            .Repeat(12) { $0
                .SetPenWidth(2)
                .Right(15)
                .Repeat(6) { $0
                    .Call("Hoge", ["penColor": { $0.PenColor + 1 }])
                    .Forward(50)
                    .Right(60)
                }
                .SetPenWidth(1)
                .Right(15)
                .Repeat(6) { $0
                    .Make("color", { $0["color"] + 1 })
                    .Print({ $0["color"] })
                    .SetPenColor({ $0["color"] })
                    .Forward(20)
                    .Right(60)
                }
            }
            .Done()
 */
    }

}
