//
//  SlackLogo.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/04/27.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import C4

class SlackLogo: View {
    
    static let COLOR_GREEN = Color(red: 0.31, green: 0.76, blue: 0.61, alpha: 1.0)
    static let COLOR_BLUE = Color(red: 0.51, green: 0.80, blue: 0.85, alpha: 1.0)
    static let COLOR_YELLOW = Color(red: 0.91, green: 0.70, blue: 0.21, alpha: 1.0)
    static let COLOR_PINK = Color(red: 0.87, green: 0.10, blue: 0.42, alpha: 1.0)
    
    let positions = [Point(53.0, 30.0),Point(76.0, 53.0),Point(53.0, 76.0),Point(30.0, 53.0)]
    var slackLines = [SlackLine]()

    override init() {
        super.init()
        frame = Rect(0,0,106,106)
        
        let colors = [SlackLogo.COLOR_BLUE, SlackLogo.COLOR_YELLOW, SlackLogo.COLOR_PINK, SlackLogo.COLOR_GREEN]
        
        for (i, (position, color)) in zip(positions, colors).enumerate() {
            let slackline = SlackLine()
            slackline.center = position
            slackline.strokeColor = color
            
            let dir = i % 2 == 0 ? 1.0 : -1.0
            slackline.transform = Transform.makeRotation(dir * Double(i) * M_PI/2)
            
            slackLines.append(slackline)
            //add(slackline)
        }
        
        for line in slackLines {
            add(line)
        }
        
        rotation = -M_PI/10.0
    }
    
}