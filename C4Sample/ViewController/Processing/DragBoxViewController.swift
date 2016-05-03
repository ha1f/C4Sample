//
//  DragBoxViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/05/03.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import C4

class DragBoxViewController: CanvasController {
    override func setup() {
        let rect = Rectangle(frame: Rect(0,0,100,100))
        rect.center = canvas.center
        rect.strokeColor = clear
        canvas.add(rect)
        
        var position = Point()
        let press = rect.addLongPressGestureRecognizer { (locations, center, state) -> () in
            switch state {
            case .Began:
                ShapeLayer.disableActions = true
                rect.strokeColor = C4Pink
                rect.fillColor = white
                position = center
            case .Changed:
                let dxdy = Vector(center) - Vector(position)
                rect.center += dxdy
            case .Ended:
                rect.strokeColor = clear
                rect.fillColor = C4Blue
            default:
                _ = ""
            }
        }
        press.minimumPressDuration = 0.0
    }
    
    // ステータスバーを表示
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
}
