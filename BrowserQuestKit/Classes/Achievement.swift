//
//  Achievement.swift
//  BrowserQuestKit
//
//  Created by Tatsuya Tobioka on 10/26/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import UIKit
import SpriteKit

open class Achievement: SKSpriteNode {
    static let image = UIImage(named: "achievements", in: Utility.shared.bundle, compatibleWith: nil)!
    static let texture = SKTexture(image: image)
    
    public init(_ name: AchievementName) {
        var rect = name.rect
        let size = rect.size
        let textureSize = Achievement.texture.size()
        let textureWidth = textureSize.width
        let textureHeight = textureSize.height
        rect.origin.x /= textureWidth
        rect.origin.y /= textureHeight
        rect.size.width /= textureWidth
        rect.size.height /= textureHeight
        let texture = SKTexture(rect: rect, in: Achievement.texture)
        super.init(texture: texture, color: SKColor.clear, size: size)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
