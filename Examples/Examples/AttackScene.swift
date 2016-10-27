//
//  ReadmeScene.swift
//  Examples
//
//  Created by Tatsuya Tobioka on 10/20/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import SpriteKit

import BrowserQuestKit

class AttackScene: SKScene {
    let sprite = Sprite(.clotharmor)
    let bat = Sprite(.bat)
    
    var chars = [SKSpriteNode]()
    var weapons = [SKSpriteNode]()
    
    let dirs = ["down", "left", "up", "right"]
    var dirIndex = 0
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.lightGray
        
        sprite.position = view.center
        sprite.animate(.idleDown)
        addChild(sprite)
        
        sprite.weapon = .sword2
        
        
        bat.position.x = sprite.position.x + Map.tileSize
        bat.position.y = sprite.position.y
        bat.animate(.idleLeft)
        addChild(bat)
        
        zoom(0.5)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        if nodes(at: location).first != nil {
            let dir = dirs[dirIndex]
            
            let animation = SpriteAnimation(rawValue: "atk_\(dir)")!
            sprite.animate(animation, speed: .fast, forever: false)
            
            if dir == "right" {
                bat.damage(5, force: true)
            }
        } else {
            dirIndex += 1
            dirIndex %= dirs.count
            let animation = SpriteAnimation(rawValue: "idle_\(dirs[dirIndex])")!
            sprite.animate(animation)
        }
    }
}
