//
//  AudioPlayer.swift
//  Restart
//
//  Created by Jhonathan Vidal on 05/22/25.
//

import Foundation

import AVFoundation

var audioPlayer: AVAudioPlayer?


func playSound(sound: String, type: String)  -> Void {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }
        catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
