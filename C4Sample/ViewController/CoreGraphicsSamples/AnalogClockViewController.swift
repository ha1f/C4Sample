//
//  AnalogClockViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/05/03.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import UIKit

class AnalogClockViewController: UIViewController {
    var clockView: ClockView!
    
    private var timer: NSTimer!
    private let duration: NSTimeInterval = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor()
        
        clockView = AnalogClockView(frame: CGRectMake(0, 0, 300, 300))
        clockView.backgroundColor = UIColor.yellowColor()
        clockView.center = self.view.center
        self.view.addSubview(clockView)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(duration, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func update(timer: NSTimer) {
        let now = NSDate()
        UIView.animateWithDuration(duration) {
            self.clockView.updateTime(now)
        }
    }
}
