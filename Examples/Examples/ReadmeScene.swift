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
    override func didMove(to view: SKView) {
        let sprite = Sprite(.clotharmor)
        sprite.position = view.center
        sprite.animate(.walkRight)
        addChild(sprite)
    }
}
