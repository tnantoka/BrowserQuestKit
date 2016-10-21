//
//  Sprite.swift
//  BrowserQuestKit
//
//  Created by Tatsuya Tobioka on 10/9/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import UIKit
import SpriteKit

open class Sprite: SKNode {
    
    typealias Animations = [String: [String: CGFloat]]
    typealias JSON = (
        width: CGFloat,
        height: CGFloat,
        animations: Animations,
        offsetY: CGFloat,
        texture: SKTexture
    )
    
    let json: JSON
    
    let spriteNode: SKSpriteNode
    let shadow: Sprite?
    
    public init(_ name: SpriteName, withShadow: Bool, physics: Bool) {
        let bundle = Utility.shared.bundle
        
        let data = try! Data(contentsOf: bundle.url(forResource: name.rawValue, withExtension: "json")!)
        let jsonObject = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        
        let id = jsonObject["id"] as! String
        let width = jsonObject["width"] as! CGFloat
        let height = jsonObject["height"] as! CGFloat

        var animations = jsonObject["animations"] as? Animations ?? [:]
        for (name, animation) in animations {
            if name.hasSuffix("_right") {
                let left = name.replacingOccurrences(of: "right", with: "left")
                animations[left] = animation
            }            
        }
        if animations.isEmpty {
            animations["default"] = [
                "length": 1.0,
                "row": 0.0
            ]
        }

        let offsetY = (jsonObject["offset_y"] as? CGFloat ?? 0.0) / 4.0

        let image = UIImage(named: id, in: bundle, compatibleWith: nil)!
        let texture = SKTexture(image: image)
        
        json = JSON(
            width: width,
            height: height,
            animations: animations,
            offsetY: offsetY,
            texture: texture
        )

        spriteNode = SKSpriteNode(texture: nil, color: UIColor.clear, size: CGSize(width: width, height: height))

        if withShadow {
            shadow = Sprite(.shadow16, withShadow: false, physics: false)
            shadow?.animate(.first)
        } else {
            shadow = nil
        }

        super.init()

        if physics {
            physicsBody = SKPhysicsBody.init(rectangleOf: CGSize(width: Map.tileSize, height: Map.tileSize))
            physicsBody?.affectedByGravity = false
            physicsBody?.categoryBitMask = BitMask.sprite
            physicsBody?.collisionBitMask = BitMask.sprite | BitMask.map
            physicsBody?.allowsRotation = false
        }

        if let shadow = shadow {
            addChild(shadow)
        }
        addChild(spriteNode)
    }

    public convenience init(_ name: SpriteName, withPhysics: Bool) {
        self.init(name, withShadow: true, physics: withPhysics)
    }

    public convenience init(_ name: SpriteName, withShadow: Bool) {
        self.init(name, withShadow: withShadow, physics: true)
    }

    public convenience init(_ name: SpriteName) {
        self.init(name, withShadow: true, physics: true)
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func canAnimate(_ animation: SpriteAnimation) -> Bool {
        return json.animations[animation.rawValue] != nil
    }
    
    public func animate(_ animation: SpriteAnimation, speed: AnimationSpeed = .normal, forever: Bool = true) {
        guard let jsonAnimation = animation == .first ? json.animations.first?.value : json.animations[animation.rawValue],
            let length = jsonAnimation["length"],
            let row = jsonAnimation["row"]
        else {
            return
        }
        
        let textures = stride(from: 0.0, to: length, by: 1.0)
            .map { subTexture(col: $0, row: row) }
        
        let animate = SKAction.animate(with: textures, timePerFrame: speed.rawValue)
        let key = "animate"
        removeAction(forKey: key)
        if forever {
            let forever = SKAction.repeatForever(animate)
            spriteNode.run(forever, withKey: key)
        } else {
            spriteNode.run(animate, withKey: key)
        }
        
        spriteNode.xScale = animation.xScale
    }
    
    func subTexture(col: CGFloat, row: CGFloat) -> SKTexture {
        let (width, height, _, offsetY, texture) = json

        let textureSize = texture.size()
        let textureWidth = textureSize.width
        let textureHeight = textureSize.height
        
        let flippedRow = row + 1
        
        let rect = CGRect(
            x: col * width / textureWidth,
            y: (textureHeight - flippedRow * height + offsetY) / textureHeight,
            width: width / textureWidth,
            height: height / textureHeight
        )
        return SKTexture(rect: rect, in: texture)
    }
}
