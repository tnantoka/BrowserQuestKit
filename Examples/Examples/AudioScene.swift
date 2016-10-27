//
//  AudioScene.swift
//  Examples
//
//  Created by Tatsuya Tobioka on 10/16/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import UIKit
import SpriteKit

import BrowserQuestKit

class AudioScene: SKScene {
    private var sprite: Sprite!

    override func didMove(to view: SKView) {
        sprite = Sprite(.clotharmor)
        sprite.position = view.center
        sprite.physicsBody?.affectedByGravity = true
        addChild(sprite)
        sprite.animate(.walkDown)

        Music.play(.village, forScene: self)

        let ground = SKSpriteNode(color: SKColor.white, size: CGSize(width: size.width, height: 2.0))
        ground.position.x = view.center.x
        ground.position.y = view.center.y - 50.0
        ground.physicsBody = SKPhysicsBody(rectangleOf: ground.size)
        ground.physicsBody?.isDynamic = false
        addChild(ground)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Sound.shared.play(.chat)
        
        sprite.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 6.0))
    }
}
