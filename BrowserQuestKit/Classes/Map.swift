//
//  Map.swift
//  BrowserQuestKit
//
//  Created by Tatsuya Tobioka on 10/13/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import Foundation
import SpriteKit

open class Map: SKNode {
    public static let tileSize: CGFloat = 16.0

    static let image = UIImage(named: "tilesheet", in: Utility.shared.bundle, compatibleWith: nil)!
    static let texture = SKTexture(image: image)
    
    static var tileGroups: [SKTileGroup] = {
        let cols = image.size.width / tileSize
        let rows = image.size.height / tileSize
        
        let groups = stride(from: 0, to: rows, by: 1.0).map { i in
            stride(from: 0, to: cols, by: 1.0).map { j in
                tileGroup(col: j, row: i)
            }
        }

        return groups.flatMap { $0 }
    }()
    static var tileSet: SKTileSet = {
        return SKTileSet(tileGroups: tileGroups)
    }()
    
    
    let layerNodes: [SKTileMapNode]
    
    public init(layers: [[[Int]]], collisions: [Int]) {
        let collisionsNode = SKNode()
        
        var layerNodes = [SKTileMapNode]()
        for layer in layers {
            let layerNode = SKTileMapNode(
                tileSet: Map.tileSet,
                columns: layer[0].count,
                rows: layer.count,
                tileSize: CGSize(width: Map.tileSize, height: Map.tileSize)
            )
            for (i, row) in layer.reversed().enumerated() {
                for (j, index) in row.enumerated() {
                    if index > 0 {
                        let group = Map.tileGroups[index]
                        layerNode.setTileGroup(group, forColumn: j, row: i)                        
                    }
                    if collisions.contains(index) {
                        let x = CGFloat(j) * Map.tileSize - layerNode.frame.width / 2.0
                        let y = CGFloat(i) * Map.tileSize - layerNode.frame.height / 2.0
                        let collisionNode = SKNode()
                        collisionNode.physicsBody = SKPhysicsBody(rectangleOf: layerNode.tileSize, center: CGPoint(x: Map.tileSize / 2.0, y: Map.tileSize / 2.0))
                        collisionNode.physicsBody?.isDynamic = false
                        collisionNode.physicsBody?.categoryBitMask = BitMask.map
                        collisionNode.physicsBody?.collisionBitMask = BitMask.sprite
                        collisionNode.position = CGPoint(x: x, y: y)
                        collisionsNode.addChild(collisionNode)
                    }
                }
            }
            layerNodes.append(layerNode)
        }
        self.layerNodes = layerNodes
        
        super.init()

        for layerNode in layerNodes {
            addChild(layerNode)
        }
        addChild(collisionsNode)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private static func tileGroup(col: CGFloat, row: CGFloat) -> SKTileGroup {
        let textureSize = texture.size()
        let textureWidth = textureSize.width
        let textureHeight = textureSize.height

        let rect = CGRect(
            x: col * tileSize / textureWidth,
            y: row * tileSize / textureHeight,
            width: tileSize / textureWidth,
            height: tileSize / textureHeight
        )
        let groupTexture = SKTexture(rect: rect, in: texture)
        let def = SKTileDefinition(texture: groupTexture, size: CGSize(width: tileSize, height: tileSize))
        let group = SKTileGroup(tileDefinition: def)
        return group
    }
    
    public func centerOfTile(atColumn column: Int, row: Int) -> CGPoint {
        let center = layerNodes[0].centerOfTile(atColumn: column, row: row)
        return layerNodes[0].convert(center, to: parent!)
    }

    public func frameOfTile(atColumn column: Int, row: Int) -> CGRect {
        let center = centerOfTile(atColumn: column, row: row)
        return CGRect(
            x: center.x - Map.tileSize / 2.0,
            y: center.y - Map.tileSize / 2.0,
            width: Map.tileSize,
            height: Map.tileSize
        )
    }

    public func tileIndex(fromPosition position: CGPoint) -> (column: Int, row: Int) {
        let converted = convert(position, from: parent!)
        let column = layerNodes[0].tileColumnIndex(fromPosition: converted)
        let row = layerNodes[0].tileRowIndex(fromPosition: converted)
        return (column, row)
    }
}
