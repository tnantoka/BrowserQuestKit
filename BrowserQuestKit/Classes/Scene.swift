//
//  Scene.swift
//  BrowserQuestKit
//
//  Created by Tatsuya Tobioka on 10/16/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import Foundation
import SpriteKit

public extension SKScene {
    public func zoom(_ scale: CGFloat) {
        let name = "camera"
        let cameraNode: SKCameraNode
        if let childNode = childNode(withName: name) as? SKCameraNode {
            cameraNode = childNode
        } else {
            cameraNode = SKCameraNode()
            addChild(cameraNode)
        }
        cameraNode.name = name
        cameraNode.position = CGPoint(x: size.width / 2.0, y: size.height / 2.0)

        camera = cameraNode
        
        cameraNode.setScale(scale)
    }
}
