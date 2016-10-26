//
//  AchievementsScene.swift
//  Examples
//
//  Created by Tatsuya Tobioka on 10/26/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import UIKit
import SpriteKit

import BrowserQuestKit

class AchievementsScene: SKScene {
    let achievements: [AchievementName] = [
        .coin1, .coin2, .coin3, .coin4, .coin5,
        .coin6, .coin7, .coin8, .coin9, .coin10,
        .coin11, .coin12, .coin13, .coin14, .coin15,
        .coin16, .coin17, .coin18, .coin19, .coin20,
        ]

    var index = 0
    var achievement: Achievement?
    
    override func didMove(to view: SKView) {
        showAchievement()
        zoom(0.5)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        index = (index + 1) % achievements.count
        showAchievement()
    }
    
    private func showAchievement() {
        self.achievement?.removeFromParent()
        let achievement = Achievement(achievements[index])
        achievement.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(achievement)
        self.achievement = achievement
    }
}
