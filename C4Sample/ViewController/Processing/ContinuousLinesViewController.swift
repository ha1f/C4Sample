//
//  ContinuousLinesViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/05/03.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import C4

class ContinuousLinesViewController: CanvasController {
    override func setup() {
        let p = Path()
        let poly = Polygon()
        canvas.add(poly)
        canvas.addPanGestureRecognizer { locations, center, translation, velocity, state in
            if state == .Began {
                p.moveToPoint(center)
            } else {
                p.addLineToPoint(center)
            }
            poly.path = p
        }
    }
}
