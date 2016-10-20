//
//  FontName.swift
//  BrowserQuestKit
//
//  Created by Tatsuya Tobioka on 10/18/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import Foundation

public enum FontName: String {
    case advocut = "AdvoCut"
    case graphicPixel = "GraphicPixel"
    
    var fileName: String {
        switch self {
        case .advocut:
            return "advocut-webfont"
        case .graphicPixel:
            return "graphicpixel-webfont"
        }
    }
    
    func load() {
        guard UIFont.fontNames(forFamilyName: rawValue).isEmpty else { return }

        let url = Utility.shared.bundle.url(forResource: fileName, withExtension: "ttf")!
        let data = try! Data(contentsOf: url)
        let provider = CGDataProvider(data: data as CFData)!
        let font = CGFont(provider)
        
        var error: Unmanaged<CFError>?
        
        CTFontManagerRegisterGraphicsFont(font, &error)
        
        guard error != nil else { return }
        
        let errorDescription = CFErrorCopyDescription(error!.takeRetainedValue())
        print(errorDescription as! String)
    }
}
