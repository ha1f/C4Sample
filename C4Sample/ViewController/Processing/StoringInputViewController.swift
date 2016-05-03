//
//  StoringInputViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/05/03.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import C4

class StoringInputViewController: CanvasController {
    let circleColor = white
    let circleRadius = 25.0
    
    override func setup() {
        canvas.backgroundColor = darkGray
        
        canvas.addPanGestureRecognizer {[weak self] locations, center, translation, velocity, state in
            guard let `self` = self else {
                return
            }
            ShapeLayer.disableActions = true
            let circle = Circle(center: center, radius: self.circleRadius)
            circle.lineWidth = 0.0
            circle.fillColor = self.circleColor
            self.canvas.add(circle)
            ShapeLayer.disableActions = false
            
            let a = ViewAnimation(duration: 1.0) {
                circle.opacity = 0.0
                circle.transform.scale(0.01, 0.01)
            }
            a.addCompletionObserver {
                circle.removeFromSuperview()
            }
            a.curve = .Linear
            a.animate()
        }
    }
    
    // ステータスバーを表示
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
}
