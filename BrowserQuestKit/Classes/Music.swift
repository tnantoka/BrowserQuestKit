//
//  Music.swift
//  BrowserQuestKit
//
//  Created by Tatsuya Tobioka on 10/16/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import Foundation
import SpriteKit

public struct Music {
    public static func play(_ name: MusicName, forScene scene: SKScene) {
        let node = get(name)
        scene.addChild(node)
    }
    
    public static func get(_ name: MusicName) -> SKAudioNode {
        let url = Utility.shared.bundle.url(forResource: name.rawValue, withExtension: "mp3")!
        let node = SKAudioNode(url: url)
        return node
    }
}
