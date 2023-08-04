//
//  AVPlayerSetting.swift
//  MI-MusicVisionPro
//
//  Created by Mind on 02/08/23.
//

import Foundation
import Combine
import AVKit

class audioSettings: NSObject, ObservableObject, AVAudioPlayerDelegate {
    
    //MARK: - IVARS....
    private var playerPeriodicObserver: Any?
    var playing: Bool = false
    var audioPlayer: AVPlayer?
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var currentTimePublisher: PassthroughSubject<Double, Never> = .init()
    var durationPublisher: PassthroughSubject<Double, Never> = .init()
    var currentProgressPublisher: PassthroughSubject<Float, Never> = .init()
    
    //MARK: - THIS OBSERVER IS USED FOR UPDATE CURRENT VALUE OF PROGRESS IN VIEWMODEL TO UPDATE UI OF SLIDER...
    private func setupPeriodicObservation(for player: AVPlayer) {
        let timeScale = CMTimeScale(NSEC_PER_SEC)
        let time = CMTime(seconds: 1, preferredTimescale: timeScale)
        
        playerPeriodicObserver = player.addPeriodicTimeObserver(forInterval: time, queue: .main) { [weak self] (time) in
            guard let `self` = self else { return }
            let progress = self.calculateProgress(currentTime: time.seconds)
            self.currentProgressPublisher.send(progress)
            self.durationPublisher.send(audioPlayer?.currentItem?.duration.seconds ?? 0)
            self.currentTimePublisher.send(time.seconds)
        }
    }
    
    //MARK: - HERE WE ARE GETTING CURRENT PROGRESS OF MUSIC...
    private func calculateProgress(currentTime: Double) -> Float {
        return Float(currentTime / duration)
    }
    
    //MARK: - IT'S GIVING TOTAL DURATION OF MUSIC....
    var duration: Double {
        return audioPlayer?.currentItem?.duration.seconds ?? 0
    }
    
    //MARK: - IT'S USER FOR PLAY MUSIC...
    func playSound(url: String) {
        if let url = URL(string: url) {
            do {
                if playing == false {
                    if (audioPlayer == nil) {
                        try audioPlayer = AVPlayer(url: url)
                        if let audioP = audioPlayer{
                            self.setupPeriodicObservation(for: audioP)
                            audioP.play()
                            playing = true
                        }
                    }
                }
                if playing == false {
                    audioPlayer?.play()
                    playing = true
                }
                
                
            } catch {
                print("Could not find and play the sound file.")
            }
        }
        
    }
    
    //MARK: - IT'S USER FOR STOP MUSIC...
    func stopSound() {
        audioPlayer?.pause()
        audioPlayer = nil
        playing = false
    }
    
    //MARK: - IT'S USER FOR PAUSE MUSIC...
    func pauseSound() {
//        if playing == true {
            audioPlayer?.pause()
            playing = false
//        }
    }
    
    //MARK: - IT'S USER FOR GET SEEK TIME WHEN USER SCROLL SLIDER IN UI...
    func seek(to time: CMTime) {
        audioPlayer?.seek(to: time)
    }
    
    //MARK: - IT'S USER FOR GET SEEK TIME WHEN USER SCROLL SLIDER IN UI...
    func seek(to percentage: Float) {
        let time = convertFloatToCMTime(percentage)
        audioPlayer?.seek(to: time)
    }
    
    private func convertFloatToCMTime(_ percentage: Float) -> CMTime {
        return CMTime(seconds: duration * Double(percentage), preferredTimescale: CMTimeScale(NSEC_PER_SEC))
    }
}
