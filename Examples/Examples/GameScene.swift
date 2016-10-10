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
        let sprite = Sprite(name: .clotharmor)
        sprite.position = view.center
        addChild(sprite)
        
        sprite.animate(animation: .walkDown)
    }    
}
