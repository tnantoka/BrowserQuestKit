//
//  Sound.swift
//  BrowserQuestKit
//
//  Created by Tatsuya Tobioka on 10/16/16.
//  Copyright © 2016 tnantoka. All rights reserved.
//

import Foundation
import AVFoundation

public class Sound {
    public static let shared = Sound()

    var audioPlayers = [String: AVAudioPlayer]()
    
    public func play(_ name: SoundName) {
        let audioPlayer: AVAudioPlayer
        if let player = audioPlayers[name.rawValue] {
            audioPlayer = player
        } else {
            let url = Utility.shared.bundle.url(forResource: name.rawValue, withExtension: "mp3")!
            audioPlayer = try! AVAudioPlayer(contentsOf: url)
        }
        audioPlayers[name.rawValue] = audioPlayer
        audioPlayer.play()
    }
}
