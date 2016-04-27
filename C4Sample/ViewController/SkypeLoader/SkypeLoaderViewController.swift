//
//  SkypeLoaderViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/04/26.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import C4

class SkypeLoaderViewController: CanvasController {
    var views = [View]()
    var circles = [Circle]()
    var container: View!
    
    let duration = 3.0
    var viewAnimationGroup: ViewAnimationGroup!
    var circleAnimationGroup: ViewAnimationGroup!
    
    var animationTimer: Timer!
    
    static let COLOR_SKYPE = Color(red: 64, green: 177, blue: 239, alpha: 1.0)
    
    override func setup() {
        canvas.backgroundColor = SkypeLoaderViewController.COLOR_SKYPE
        
        createViewsCircles()
        createAnimations()
        
        animationTimer = Timer(interval: duration/4.0) {
            self.viewAnimationGroup.animate()
            self.circleAnimationGroup.animate()
        }
        animationTimer.start()
        animationTimer.fire()
        
        let containerAnim = ViewAnimation(duration: duration) {
            self.container.rotation += 2*M_PI
        }
        containerAnim.curve = .Linear
        containerAnim.repeats = true
        containerAnim.animate()
    }
    
    func createViewsCircles() {
        container = View(frame: Rect(0, 0, 1, 1))
        for _ in 0..<4 {
            // circleピッタリ
            let v = View(frame: Rect(0, 0, 10, 10))
            views.append(v)
            
            let c = Circle(center: v.center, radius: v.width/2.0)
            c.lineWidth = 10.0
            c.strokeColor = white
            c.fillColor = white
            circles.append(c)
            
            v.add(c)
            v.anchorPoint = Point(0.5, 7.5)
            v.center = container.center
            container.add(v)
        }
        canvas.add(container)
        container.center = canvas.center
    }
    
    func createAnimations() {
        var canims = [ViewAnimation]()
        var vanims = [ViewAnimation]()
        
        for (i,v) in views.enumerate() {
            let offset = Double(i) * 0.1 + 0.05
            
            let va = ViewAnimation(duration: duration/4.0 + 0.3) {
                v.rotation += M_PI
            }
            va.delay = offset
            vanims.append(va)
        }
        
        for (i,c) in circles.enumerate() {
            let offset = Double(i) * 0.1 + 0.05
            
            let ca = ViewAnimation(duration: duration/8.0 + 0.15) {
                c.lineWidth = 0.0
            }
            ca.delay = offset
            ca.autoreverses = true
            ca.addCompletionObserver {
                ShapeLayer.disableActions = true
                c.lineWidth = 10.0
                ShapeLayer.disableActions = false
            }
            canims.append(ca)
        }
        viewAnimationGroup = ViewAnimationGroup(animations: vanims)
        circleAnimationGroup = ViewAnimationGroup(animations: canims)
    }
    
    // ステータスバーを表示
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
}
