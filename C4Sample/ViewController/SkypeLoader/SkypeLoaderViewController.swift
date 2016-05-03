//
//  SkypeLoaderViewController.swift
//  C4Sample
//
//  Created by 山口智生 on 2016/04/26.
//  Copyright © 2016年 ha1f. All rights reserved.
//

import C4

// http://c4ios.com/tutorials/skype/
class SkypeLoaderViewController: CanvasController {
    
    override func setup() {
        canvas.backgroundColor = SkypeLoaderView.COLOR_SKYPE
        
        let skypeLoaderView = SkypeLoaderView()
        skypeLoaderView.center = canvas.center
        canvas.add(skypeLoaderView)
    }
    
    // ステータスバーを表示
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
}
