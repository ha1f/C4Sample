//
//  ClockViewType.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/05/04.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import UIKit


class ClockView: UIView {
    struct ClockComponents {
        var hour: Int
        var minute: Int
        var second: Int
        var nanosecond: Int
    }
    
    private var _time: NSDate!
    var time: NSDate! {
        return _time
    }
    
    private let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
    
    private func getComponents() -> ClockComponents {
        var components = ClockComponents(hour: 0, minute: 0, second: 0, nanosecond: 0)
        calendar.getHour(&components.hour, minute: &components.minute, second: &components.second, nanosecond: &components.nanosecond, fromDate: time)
        return components
    }
    
    func updateTime(time: NSDate) {
        _time = time
        updateView(getComponents())
    }
    
    func updateView(components: ClockComponents) {
        fatalError("must override updateView()")
    }
}
