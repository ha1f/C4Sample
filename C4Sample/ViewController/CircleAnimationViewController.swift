//
//  CircleAnimationViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/04/26.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import C4

class CircleAnimationViewController: CanvasController {
    
    override func setup() {
        let orangeCircle = Circle(center: canvas.center, radius: 25)
        let orangeColor = Color(red: 226.0/255.0, green: 122.0/255.0, blue: 4.0/255.0, alpha: 1)
        orangeCircle.fillColor = orangeColor
        orangeCircle.strokeColor = orangeColor
        canvas.add(orangeCircle)
        
        let greenCircle = Circle(center: Point(canvas.center.x - 100, canvas.center.y - 120), radius: 25)
        let greenColor = Color(red: 4.0/255.0, green: 164.0/255.0, blue: 105.0/255.0, alpha: 1.0)
        greenCircle.fillColor = greenColor
        greenCircle.strokeColor = greenColor
        canvas.add(greenCircle)
        
        let scale = Transform.makeScale(100, 100)
        let fadeOutColor = Color(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)
        
        let greenAnim = ViewAnimation(duration: 0.7) {
            greenCircle.transform = scale
            greenCircle.fillColor = fadeOutColor
        }
        
        let orangeShrinkAnim = ViewAnimation(duration: 0.5) {
            orangeCircle.transform = Transform.makeScale(0.3, 0.3)
        }
        orangeShrinkAnim.curve = .EaseIn
        
        let orangeAnim = ViewAnimation(duration: 1.0) {
            orangeCircle.transform = scale
            orangeCircle.fillColor = fadeOutColor
        }
        
        let animSequence = ViewAnimationSequence(animations: [greenAnim, orangeShrinkAnim, orangeAnim])
        
        wait(1.0) {
            animSequence.animate()
        }
    }
    
    // ステータスバーを表示
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
}
