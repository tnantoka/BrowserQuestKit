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
    
    let dirs = ["right", "down", "left", "up"]
    var dirIndex = 0
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.lightGray

        sprite.position = view.center
        sprite.animate(.walkRight)
        addChild(sprite)
     
        sprite.weapon = .sword2
        
        zoom(0.5)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        if nodes(at: location).first != nil {
            let animation = SpriteAnimation(rawValue: "atk_\(dirs[dirIndex])")!
            sprite.animate(animation, speed: .fast, forever: false)
        } else {
            dirIndex += 1
            dirIndex %= dirs.count
            let animation = SpriteAnimation(rawValue: "walk_\(dirs[dirIndex])")!
            sprite.animate(animation)
        }
    }
}
