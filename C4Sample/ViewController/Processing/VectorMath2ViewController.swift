//
//  VectorMath2ViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/05/03.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import C4

class VectorMath2ViewController: CanvasController {
    override func setup() {
        let circle = Circle(center: Point(0,0), radius: 10)
        circle.strokeColor = C4Purple.colorWithAlpha(0.25)
        circle.lineWidth = 20.0
        
        let line = Line((Point(),Point(50,0)))
        line.opacity = 0.25
        line.anchorPoint = Point(0,0)
        line.lineWidth = 20
        line.center = circle.bounds.center
        
        circle.add(line)
        canvas.add(circle)
        
        var v = Vector()
        canvas.addPanGestureRecognizer { locations, center, translation, velocity, state in
            let vl = Vector(center)
            let dxdy = vl-v
            let Θ = dxdy.heading
            
            v = vl - Vector(x: cos(Θ) * 50, y: sin(Θ) * 50)
            
            ShapeLayer.disableActions = true
            circle.center = Point(v.x, v.y)
            line.rotation = Θ
        }
    }
}