//
//  Array2DViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/05/03.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import C4

class Array2DViewController: CanvasController {
    
    override func setup() {
        let maxDistance = distance(Point(0, 0), rhs: canvas.center)
        canvas.backgroundColor = black
        
        var centerPoint = Point(8, 10)
        while centerPoint.y < canvas.height {
            while centerPoint.x < canvas.width {
                let c = Circle(center: centerPoint, radius: 1.0)
                let dist = distance(centerPoint, rhs: canvas.center) / maxDistance
                c.lineWidth = 0.0
                c.fillColor = Color(red: dist, green: dist, blue: dist, alpha: 1.0)
                canvas.add(c)
                centerPoint.x += 10.0
            }
            centerPoint = Point(8.0, centerPoint.y + 10.0)
        }
    }
    
    // ステータスバーを表示
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
}
