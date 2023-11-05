//
//  Sound.swift
//  Deves
//
//  Created by SHIRAISHI HIROYUKI on 2023/11/06.
//

import Foundation
import AVFoundation

enum SoundFile: String {
    case soundchime = "sound-chime"
}

enum SoundExtension: String {
    case mp3
}

class Sound {
    static let shared = Sound()

    var player: AVAudioPlayer?

    func playSound(sound: SoundFile, type: SoundExtension) {
        if let path = Bundle.main.path(forResource: sound.rawValue, ofType: type.rawValue) {
            do {
                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                player?.play()
            } catch let error {
                dump(error)
            }
        }
    }
}
