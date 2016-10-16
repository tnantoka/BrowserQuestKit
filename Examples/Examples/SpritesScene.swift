//
//  SpritesScene.swift
//  Examples
//
//  Created by Tatsuya Tobioka on 10/16/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import UIKit
import SpriteKit

import BrowserQuestKit

class SpritesScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = UIColor.lightGray
        
        let cols = 8
        let height: CGFloat = 48.0
        let x = view.center.x - Map.tileSize * CGFloat(cols / 2)
        var position = CGPoint(x: x, y: view.center.y - height * 5.5)
        for (i, name) in SpriteName.all.enumerated() {
            let sprite = Sprite(name)
            addChild(sprite)
            sprite.canAnimate(.idleDown) ? sprite.animate(.idleDown) : sprite.animate(.first)
            sprite.physicsBody?.isDynamic = false
            position.x += Map.tileSize
            if i % cols == 0 {
                position.y += height
                position.x = x
            }
            sprite.position = position
        }
        
        zoom(0.7)
    }
}
