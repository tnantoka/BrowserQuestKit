//
//  GameScene.swift
//  Examples
//
//  Created by Tatsuya Tobioka on 10/9/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import SpriteKit
import GameplayKit

import BrowserQuestKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        let sprite = Sprite(color: UIColor.green, size: CGSize(width: 50.0, height: 50.0))
        sprite.position = view.center
        addChild(sprite)
    }    
}
