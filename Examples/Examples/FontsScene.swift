//
//  FontsScene.swift
//  Examples
//
//  Created by Tatsuya Tobioka on 10/18/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import UIKit
import SpriteKit

import BrowserQuestKit

class FontsScene: SKScene {
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.darkGray

        let hello = Label(.graphicPixel)
        hello.text = "Hello, World!"
        hello.position = view.center
        hello.fontSize = 20.0
        addChild(hello)

        let title = Label(.advocut)
        title.text = "BrowserQuestKit"
        title.position.x = view.center.x
        title.position.y = hello.frame.maxY + 10.0
        addChild(title)

        let copyright = Label(fontNamed: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize).fontName)
        copyright.text = "(c) 2016 @tnantoka"
        copyright.position.x = view.center.x
        copyright.position.y = 110.0
        copyright.fontSize = 12.0
        addChild(copyright)
    }
}
