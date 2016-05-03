//
//  VectorMathViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/05/03.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import C4

class VectorMathViewController: CanvasController {
    override func setup() {
        let line = Line((Point(0, 0), Point(100,0)))
        line.opacity = 0.25
        line.anchorPoint = Point(0, 0)
        line.lineWidth = 20
        line.center = canvas.center
        canvas.add(line)
        
        let vc = Vector(canvas.center)
        canvas.addPanGestureRecognizer { locations, center, translation, velocity, state in
            let vl = Vector(center)
            let Θ = (vl-vc).heading
            
            ShapeLayer.disableActions = true
            line.rotation = Θ
        }
    }
}