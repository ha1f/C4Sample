//
//  AnalogClockViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/05/03.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import UIKit

class AnalogClockHand: UIView {
    var width: CGFloat = 0.0
    var length: CGFloat = 0.0
    
    var angle: Double = 0.0
    
    init(width: CGFloat, length: CGFloat) {
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: length))
        self.width = width
        self.length = length
        self.layer.cornerRadius = width/2
        
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.95)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AnalogClockView: UIView {
    
    private var secondHand: AnalogClockHand!
    private var minuteHand: AnalogClockHand!
    private var hourHand: AnalogClockHand!

    var time: NSDate! {
        didSet {
            self.updateView()
        }
    }
    let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let length = min(frame.width, frame.height)
        
        secondHand = AnalogClockHand(width: 2.0, length: length)
        minuteHand = AnalogClockHand(width: 10.0, length: length)
        hourHand = AnalogClockHand(width: 10.0, length: length)
        
        hourHand.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 1.0, alpha: 0.6)
        hourHand.layer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        self.addSubview(hourHand)
        
        minuteHand.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 1.0, alpha: 0.6)
        minuteHand.layer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        self.addSubview(minuteHand)
        
        secondHand.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.6)
        secondHand.layer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        self.addSubview(secondHand)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {
        var comps = (hour: 0, minute: 0, second: 0, nanosecond: 0)
        calendar.getHour(&comps.hour, minute: &comps.minute, second: &comps.second, nanosecond: &comps.nanosecond, fromDate: time)
        
        let secondAngle = (Double(comps.second) + Double(comps.nanosecond)/1000000000) * (360/60)
        UIView.animateWithDuration(0.1) {
            self.secondHand.transform = CGAffineTransformMakeRotation(CGFloat(secondAngle * M_PI / 180))
        }
        
        let minutesAngle = (Double(comps.minute) + Double(comps.second)/60) * (360/60)
        minuteHand.transform = CGAffineTransformMakeRotation(CGFloat(minutesAngle * M_PI / 180))
        
        let hourAngle = (Double(comps.hour) + Double(comps.minute)/60) * (360/12)
        hourHand.transform = CGAffineTransformMakeRotation(CGFloat(hourAngle * M_PI / 180))
    }
}

class AnalogClockViewController: UIViewController {
    var analogClockView: AnalogClockView!
    
    var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor()
        
        analogClockView = AnalogClockView(frame: CGRectMake(100, 100, 200, 200))
        analogClockView.center = self.view.center
        self.view.addSubview(analogClockView)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func update(timer: NSTimer) {
        analogClockView.time = NSDate()
    }
}
