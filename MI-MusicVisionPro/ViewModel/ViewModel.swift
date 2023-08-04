//
//  ViewModel.swift
//  MI-MusicVisionPro
//
//  Created by Mind on 02/08/23.
//

import Foundation
import Combine

class PlayerSliderViewModel: ObservableObject {
    
    //MARK: - Published IVARS....
    @Published var progressValue: Float = 0
    @Published var currentValue: Double = 0
    @Published var duration: Double = 0
    
    //MARK: - IVARS....
    var player: audioSettings
    var acceptProgressUpdates = true
    var subscriptions: Set<AnyCancellable> = .init()
    
    //MARK: - HERE VARIABLE WILL INITIALIZE WHEN CLASS OBJECT WILL CREATE....
    init(player: audioSettings) {
        self.player = player
        listenToProgress()
    }
    
    //MARK: - HERE WE ARE GETTING CURRENT PROGRESS VALUE OF MUSIC FROM AUDIOSETTING CLASS AND UPDATING VIEW ACCORDINGLY...
    private func listenToProgress() {
        player.currentProgressPublisher.sink { [weak self] progress in
            guard let self = self,
                  self.acceptProgressUpdates else { return }
            self.progressValue = progress
        }.store(in: &subscriptions)
        
        player.currentTimePublisher.sink { [weak self] currentValue in
            guard let self = self,
                  self.acceptProgressUpdates else { return }
            self.currentValue = currentValue
        }.store(in: &subscriptions)
        
        player.durationPublisher.sink { [weak self] durationValue in
            guard let self = self,
                  self.acceptProgressUpdates else { return }
            self.duration = durationValue
        }.store(in: &subscriptions)
    }
    
    func didSliderChanged(_ didChange: Bool) {
        acceptProgressUpdates = !didChange
        if didChange {
            player.audioPlayer?.pause()
        } else {
            player.seek(to: progressValue)
            player.audioPlayer?.play()
        }
    }
}
