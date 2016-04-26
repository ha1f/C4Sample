//
//  PieChartViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/04/26.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import C4

class PieChartViewController: CanvasController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func drawPieChart(angles: [Double], center: Point, radius: Double) {
        let count = angles.count
        let colors = (0..<count).map{ i in Double(i) / Double(count) }
        
        var currentAngle = -M_PI/2
        for (angleDegree, colorValue) in zip(angles, colors) {
            let angle = degToRad(angleDegree)
            let wedge = Wedge(center: center, radius: radius, start: currentAngle, end: currentAngle + angle)
            wedge.fillColor = Color(red: colorValue, green: colorValue, blue: colorValue, alpha: 1.0)
            wedge.lineWidth = 0.0
            currentAngle += angle
            canvas.add(wedge)
        }
    }
    
    override func setup() {
        let angles: [Double] = [30.0, 10, 45, 35, 60, 38, 75, 67]
        drawPieChart(angles, center: canvas.center, radius: 150)
    }
    
    // ステータスバーを表示
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
}