//
//  Sprite.swift
//  BrowserQuestKit
//
//  Created by Tatsuya Tobioka on 10/9/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import UIKit
import SpriteKit


open class Sprite: SKSpriteNode {
    
    typealias Animations = [String: [String: CGFloat]]
    typealias JSON = (
        width: CGFloat,
        height: CGFloat,
        animations: Animations,
        texture: SKTexture
    )
    
    let json: JSON
    
    public init(name: SpriteName) {
        let bundle = Utility.shared.bundle
        
        let data = try! Data(contentsOf: bundle.url(forResource: name.rawValue, withExtension: "json")!)
        let jsonObject = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        
        let id = jsonObject["id"] as! String
        let width = jsonObject["width"] as! CGFloat
        let height = jsonObject["height"] as! CGFloat

        let animations = jsonObject["animations"] as! Animations
        
        let image = UIImage(named: id, in: bundle, compatibleWith: nil)!
        let texture = SKTexture(image: image)
        
        json = JSON(
            width: width,
            height: height,
            animations: animations,
            texture: texture
        )

        super.init(texture: nil, color: UIColor.clear, size: CGSize(width: width, height: height))
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func animate(animation: SpriteAnimation) {
        guard let jsonAnimation = json.animations[animation.rawValue],
            let length = jsonAnimation["length"],
            let row = jsonAnimation["row"]
        else {
            return
        }
        
        let textures = stride(from: 0.0, to: length, by: 1.0)
            .map { subTexture(col: $0, row: row) }
        
        let animate = SKAction.animate(with: textures, timePerFrame: animation.timePerFrame)
        let forever = SKAction.repeatForever(animate)
        
        removeAllActions()
        run(forever)
    }
    
    private func subTexture(col: CGFloat, row: CGFloat) -> SKTexture {
        let (width, height, _, texture) = json

        let textureSize = texture.size()
        let textureWidth = textureSize.width
        let textureHeight = textureSize.height
        
        let flippedRow = row + 1
        
        let rect = CGRect(
            x: col * width / textureWidth,
            y: (textureHeight - flippedRow * height) / textureHeight,
            width: width / textureWidth,
            height: height / textureHeight
        )
        return SKTexture(rect: rect, in: texture)
    }
}
