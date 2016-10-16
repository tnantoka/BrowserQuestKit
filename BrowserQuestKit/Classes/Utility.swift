//
//  Utility.swift
//  BrowserQuestKit
//
//  Created by Tatsuya Tobioka on 10/10/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import Foundation
import SpriteKit

class Utility {
    static let shared = Utility()
        
    lazy var bundle: Bundle = {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "BrowserQuestKit", ofType: "bundle")!
        return Bundle(path: path)!
    }()
    
    var screenScale: CGFloat {
        return UIScreen.main.scale
    }
}
