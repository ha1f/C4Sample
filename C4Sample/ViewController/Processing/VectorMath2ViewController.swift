//
//  VectorMath2ViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/05/03.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import C4

class VectorMath2ViewController: CanvasController {
    let lineLength = 50.0
    let originPoint = Point(50, 150)
    
    override func setup() {
        // 実質円と線
        let circle = Circle(center: originPoint, radius: 10)
        circle.strokeColor = C4Purple.colorWithAlpha(0.25)
        circle.lineWidth = 20.0
        circle.masksToBounds = false
        
        let line = Line((originPoint, Point(originPoint.x + lineLength, originPoint.y)))
        line.opacity = 0.25
        line.anchorPoint = Point(0, 0.5)
        line.lineWidth = 20
        line.center = circle.bounds.center
        
        circle.add(line)
        canvas.add(circle)
        
        canvas.addPanGestureRecognizer {[weak self] locations, center, translation, velocity, state in
            guard let `self` = self else {
                return
            }
            
            let touchVector = Vector(center)
            let Θ = (touchVector - Vector(circle.center)).heading
            
            // タッチの位置から、もとの円の中心方向にlineLength分移動した点に円を移動させる
            let v = touchVector - Vector(x: cos(Θ) * self.lineLength, y: sin(Θ) * self.lineLength)
            
            ShapeLayer.disableActions = true
            circle.center = Point(v.x, v.y)
            line.rotation = Θ
        }
    }
    
    // ステータスバーを表示
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
}
