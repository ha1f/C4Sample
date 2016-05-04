//
//  AnalogClockView.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/05/04.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import UIKit

class AnalogClockView: ClockView {
    private class DefaultAnalogClockHandView: UIView {
        override init(frame: CGRect) {
            super.init(frame: frame)
            layer.cornerRadius = frame.width / 2
        }
        
        required convenience init?(coder aDecoder: NSCoder) {
            self.init(frame: CGRectZero)
        }
    }
    
    private var secondHandView: UIView!
    private var minuteHandView: UIView!
    private var hourHandView: UIView!
    
    init(frame: CGRect, secondView: UIView, minuteView: UIView, hourView: UIView) {
        super.init(frame: frame)
        
        secondHandView = secondView
        minuteHandView = minuteView
        hourHandView = hourView
        
        let boundsCenter = CGPoint(x: bounds.midX, y: bounds.midY)
        hourHandView.layer.position = boundsCenter
        minuteHandView.layer.position = boundsCenter
        secondHandView.layer.position = boundsCenter
        
        let anchorPoint = CGPoint(x: 0.5, y: 0.95)
        hourHandView.layer.anchorPoint = anchorPoint
        minuteHandView.layer.anchorPoint = anchorPoint
        secondHandView.layer.anchorPoint = anchorPoint
        
        self.addSubview(hourHandView)
        self.addSubview(minuteHandView)
        self.addSubview(secondHandView)
    }
    
    override convenience init(frame: CGRect) {
        let length = min(frame.width, frame.height)/2
        
        let secondHandView = DefaultAnalogClockHandView(frame: CGRect(x: 0, y: 0, width: 2.0, height: length))
        secondHandView.backgroundColor = UIColor(red: 1.0, green: 0, blue: 0, alpha: 0.6)
        
        let minuteHandView = DefaultAnalogClockHandView(frame: CGRect(x: 0, y: 0, width: 10.0, height: length))
        minuteHandView.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 1.0, alpha: 0.6)
        
        let hourHandView = DefaultAnalogClockHandView(frame: CGRect(x: 0, y: 0, width: 10.0, height: length*2/3))
        hourHandView.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 1.0, alpha: 0.6)
        
        self.init(frame: frame, secondView: secondHandView, minuteView: minuteHandView, hourView: hourHandView)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
        self.init(frame: rect)
    }
    
    override func updateView(components: ClockComponents) {
        let secondAngle = (Double(components.second) + Double(components.nanosecond)/pow(10, 9)) * 2 * M_PI / 60
        secondHandView.transform = CGAffineTransformMakeRotation(CGFloat(secondAngle))
        
        let minutesAngle = (Double(components.minute) + Double(components.second)/60) * 2 * M_PI / 60
        minuteHandView.transform = CGAffineTransformMakeRotation(CGFloat(minutesAngle))
        
        let hourAngle = (Double(components.hour) + Double(components.minute)/60) * 2 * M_PI / 12
        hourHandView.transform = CGAffineTransformMakeRotation(CGFloat(hourAngle))
    }
}
