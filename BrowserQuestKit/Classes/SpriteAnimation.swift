//
//  SpriteAnimation.swift
//  BrowserQuestKit
//
//  Created by Tatsuya Tobioka on 10/10/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import Foundation

public enum SpriteAnimation: String {
    case walkRight = "walk_right"
    case walkUp = "walk_up"
    case walkDown = "walk_down"
    case walkLeft = "walk_left"
    case idleDown = "idle_down"
    
    var xScale: CGFloat {
        switch self {
        case .walkLeft:
            return -1
        default:
            return 1
        }
    }
}
