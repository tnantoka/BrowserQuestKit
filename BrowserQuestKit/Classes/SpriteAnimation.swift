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
    case idleRight = "idle_right"
    case idleUp = "idle_up"
    case idleDown = "idle_down"
    case idleLeft = "idle_left"
    case idle = "idle"
    case atkRight = "atk_right"
    case atkUp = "atk_up"
    case atkDown = "atk_down"
    case atkLeft = "atk_left"
    
    case first = "first"
    
    var xScale: CGFloat {
        switch self {
        case .walkLeft:
            return -1
        default:
            return 1
        }
    }
}
