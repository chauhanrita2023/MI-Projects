//
//  PlayingSongCardView.swift
//  MI-MusicVisionPro
//
//  Created by Mind on 02/08/23.
//

import SwiftUI

struct PlayingSongCardView: View {
    
    //MARK: - IVARS....
    @ObservedObject var viewModel: PlayerSliderViewModel
    @Binding var selectedAlbum : Album?
    @ObservedObject var player: audioSettings
    
    //MARK: - THIS UI WILL UPDATE ACCORDING TO SELECTION OF SIDEMENU....
    var body: some View {
        HStack{
            if let album = self.selectedAlbum{
                Image(album.image, bundle: nil)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55, height: 55, alignment: .center)
                    .cornerRadius(6)
                
                VStack(alignment: .leading, spacing: 10){
                    Text(album.title)
                        .frame(height: 25)
                    Slider(value: $viewModel.progressValue) { didChange in
                        viewModel.didSliderChanged(didChange)
                        
                    }
                    .onChange(of: viewModel.progressValue, { oldValue, newValue in
                        if viewModel.progressValue == 1{
                            player.pauseSound()
                            viewModel.progressValue = 0.0
                            selectedAlbum?.isPlaying = false
                            viewModel.player.audioPlayer = nil
                        }
                    })
                    .frame(height: 20)
                }
                
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                }.buttonBorderShape(.circle)
            }
        }
        .padding(.all, 12)
        .background(.regularMaterial, in: .rect(cornerRadius: 14))
    }
}

