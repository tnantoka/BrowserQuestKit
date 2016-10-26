//
//  AchievementName.swift
//  BrowserQuestKit
//
//  Created by Tatsuya Tobioka on 10/26/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import Foundation

public enum AchievementName {
    case coin1, coin2, coin3, coin4, coin5
    case coin6, coin7, coin8, coin9, coin10
    case coin11, coin12, coin13, coin14, coin15
    case coin16, coin17, coin18, coin19, coin20
    
    var width: CGFloat {
        return 24.0
    }
    var size: CGSize {
        return CGSize(width: width, height: 26.0)
    }
    
    var rect: CGRect {
        return CGRect(origin: origin, size: size)
    }
    
    var origin: CGPoint {
        let y1: CGFloat = 56.0
        let y2: CGFloat = 4.0
        
        switch self {
        case .coin1:
            return CGPoint(x: 0.0, y: y1)
        case .coin2:
            return CGPoint(x: width * 1.0, y: y1)
        case .coin3:
            return CGPoint(x: width * 2.0, y: y1)
        case .coin4:
            return CGPoint(x: width * 3.0, y: y1)
        case .coin5:
            return CGPoint(x: width * 4.0, y: y1)
        case .coin6:
            return CGPoint(x: width * 5.0, y: y1)
        case .coin7:
            return CGPoint(x: width * 6.0, y: y1)
        case .coin8:
            return CGPoint(x: width * 7.0, y: y1)
        case .coin9:
            return CGPoint(x: width * 8.0, y: y1)
        case .coin10:
            return CGPoint(x: width * 9.0, y: y1)
        case .coin11:
            return CGPoint(x: width * 10.0, y: y1)
        case .coin12:
            return CGPoint(x: width * 11.0, y: y1)
        case .coin13:
            return CGPoint(x: width * 12.0, y: y1)
        case .coin14:
            return CGPoint(x: width * 13.0, y: y1)
        case .coin15:
            return CGPoint(x: width * 14.0, y: y1)
        case .coin16:
            return CGPoint(x: width * 15.0, y: y1)
        case .coin17:
            return CGPoint(x: width * 16.0, y: y1)
        case .coin18:
            return CGPoint(x: width * 9.0, y: y2)
        case .coin19:
            return CGPoint(x: width * 10.0, y: y2)
        case .coin20:
            return CGPoint(x: width * 11.0, y: y2)
        }
    }
}
