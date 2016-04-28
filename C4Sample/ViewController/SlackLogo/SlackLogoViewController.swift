//
//  SlackLogoViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/04/27.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import C4

class SlackLogoViewController: CanvasController {
    
    override func setup() {
        let sl = SlackLogo(size: 106)
        sl.center = canvas.center
        canvas.add(sl)
    }
    
    // ステータスバーを表示
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
}
