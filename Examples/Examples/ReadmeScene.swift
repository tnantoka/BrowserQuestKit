//
//  ReadmeScene.swift
//  Examples
//
//  Created by Tatsuya Tobioka on 10/20/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import SpriteKit

import BrowserQuestKit

class ReadmeScene: SKScene {
    let sprite = Sprite(.clotharmor)

    var chars = [SKSpriteNode]()
    var weapons = [SKSpriteNode]()
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.lightGray

        sprite.position = view.center
        sprite.animate(.walkRight)
        addChild(sprite)
     
        sprite.weapon = .sword2
        
        zoom(0.5)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sprite.animate(.atkRight, speed: .fast, forever: false)
    }
}
