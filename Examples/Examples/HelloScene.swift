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
    
    private var sprite: Sprite!
    private var map: Map!
    
    override func didMove(to view: SKView) {
        sprite = Sprite(.clotharmor)
        addChild(sprite)
        sprite.animate(.walkDown)

        let layer1 = [
            [504, 505, 506, 506, 507, 507, 508, 509],
            [484, 485, 486, 486, 487, 487, 488, 489],
            [464, 465, 466, 466, 467, 467, 468, 469],
            [464, 465, 466, 466, 467, 467, 468, 469],
            [464, 465, 466, 466, 467, 467, 468, 469],
            [444, 445, 446, 446, 447, 447, 448, 449],
            [444, 445, 446, 446, 447, 447, 448, 449],
            [444, 445, 446, 446, 447, 447, 448, 449],
            [424, 425, 426, 426, 427, 427, 428, 429],
            [404, 405, 406, 406, 407, 407, 408, 409]
        ]
        let layer2 = [
            [-1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, 285, 286, -1, -1, -1],
            [-1, -1, -1, 265, 266, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1],
            [-1, -1, -1, -1, -1, -1, -1, -1], 
            [-1, -1, -1, -1, -1, -1, -1, -1]
        ]
        let collisions = [
            // layer1
            485, 486, 487, 488,
            465, 468,
            445, 448,
            425, 426, 427, 428,
            // layer2
            285, 286,
            265, 266
        ]
        map = Map(layers: [layer1, layer2], collisions: collisions)
        map.position = view.center
        addChild(map)
        
        let position = map.centerOfTile(atColumn: 2, row: 2)
        sprite.position = position
        
        let chest = Sprite(.chest)
        addChild(chest)
        chest.animate(.idleDown)
        chest.position = map.centerOfTile(atColumn: 5, row: 7)
        chest.physicsBody?.isDynamic = false

        let sword = Sprite(.itemSword1, sparks: true)
        addChild(sword)
        sword.animate(.idle)
        sword.position = map.centerOfTile(atColumn: 2, row: 7)
        sword.physicsBody?.isDynamic = false

        sprite.zPosition = 1.0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        var index = map.tileIndex(fromPosition: sprite.position)
        let frame = map.frameOfTile(atColumn: index.column, row: index.row)
        
        if location.x > frame.maxX {
            index.column += 1
            sprite.animate(.walkRight)
        } else if location.x < frame.minX {
            index.column -= 1
            sprite.animate(.walkLeft)
        } else if location.y > frame.maxY {
            index.row += 1
            sprite.animate(.walkUp)
        } else if location.y < frame.minY {
            index.row -= 1
            sprite.animate(.walkDown)
        }
        
        let position = map.centerOfTile(atColumn: index.column, row: index.row)
        let action = SKAction.move(to: position, duration: AnimationSpeed.normal.rawValue)
        sprite.run(action)
    }
}
