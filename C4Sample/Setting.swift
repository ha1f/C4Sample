//
//  Setting.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/04/27.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import UIKit

class Setting {
    static let samples: [(title: String, type: UIViewController.Type)] = [
        ("PieChart", PieChartViewController.self),
        ("CircleAnimation", CircleAnimationViewController.self),
        ("SkypeLoader", SkypeLoaderViewController.self),
        ("SlackLogo", SlackLogoViewController.self),
    ]
}
