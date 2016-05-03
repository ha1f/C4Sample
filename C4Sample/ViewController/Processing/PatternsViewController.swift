//
//  PatternsViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/05/03.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import C4

class PatternsViewController: CanvasController {
    override func setup() {
        var circles = [Circle]()
        canvas.addPanGestureRecognizer { locations, center, translation, velocity, state in
            let c = Circle(center: center, radius: abs(velocity.x/50.0))
            c.lineWidth = abs(velocity.y/100.0)
            self.canvas.add(c)
            circles.append(c)
            if circles.count > 100 {
                let c = circles.removeFirst()
                c.removeFromSuperview()
            }
        }
    }
}