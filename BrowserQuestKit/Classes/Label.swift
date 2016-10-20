//
//  Label.swift
//  BrowserQuestKit
//
//  Created by Tatsuya Tobioka on 10/18/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import UIKit
import SpriteKit

open class Label: SKLabelNode {
    public init(_ name: FontName?) {
        name?.load()
        super.init(fontNamed: name?.rawValue)
    }
    
    public override init() {
        super.init()
    }
    
    public convenience init(text: String?) {
        self.init()
        self.text = text
    }

    public override init(fontNamed fontName: String?) {
        super.init(fontNamed: fontName)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
