//
//  SpriteAnimation.swift
//  BrowserQuestKit
//
//  Created by Tatsuya Tobioka on 10/10/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import Foundation

public enum SpriteAnimation: String {
    case walkDown = "walk_down"
    
    var timePerFrame: TimeInterval {
        return 0.3
    }
}
