//
//  AlbumsView.swift
//  MI-MusicVisionPro
//
//  Created by Mind on 02/08/23.
//

import SwiftUI
import AVKit
import Combine

struct AlbumsView: View {
    
    //MARK: - IVARS....
    var sideMenu: SideMenuStruct
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 150, maximum: 200))]
    @State private var searchText: String = ""
    @State private var isMuted: Bool = false
    @State private var albumsArray = albums
    @State private var selectedAlbum = recent.first
    @ObservedObject var audiosettings = audioSettings()
    
    //    var stopMusic:((audioSettings)->Void)
    
    //MARK: - IT WILL SHOW MAIN CONTENT OF SELECTED SIDE MENU....
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText, placeholder: "Search in Albums")
            
            LazyVGrid(columns: columns, spacing: 24, content: {
                ForEach(self.getLatestMusic().filter {
                    self.searchText.isEmpty ? true : $0.title.lowercased().contains(self.searchText.lowercased())
                }, id: \.self) { album in
                    Button(action: {
                        self.audiosettings.pauseSound()
                        self.selectedAlbum?.isPlaying = false
                        self.audiosettings.audioPlayer = nil
                        selectedAlbum = album
                        
                        //                        stopMusic(self.audiosettings)
                    }) {
                        VStack( alignment: .leading) {
                            Image(album.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(10)
                            Text(album.title)
                                .lineLimit(1)
                                .lineLimit(0, reservesSpace: false)
                            Text(album.subTitle)
                                .lineLimit(1)
                                .foregroundStyle(.tertiary)
                        }
                    }
                    .buttonStyle(.plain)
                    .padding(.all,15)
                    .background(selectedAlbum?.title == album.title ? .white.opacity(0.4) : .clear)
                    .cornerRadius(12)
                    
                    
                }
            })
            
        }.padding(.horizontal, 24)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    VStack(alignment: .leading, content: {
                        Text(sideMenu.name)
                            .font(.largeTitle)
                        
                        Text("48 songs")
                            .foregroundStyle(.tertiary)
                    })
                }
                
                ToolbarItem {
                    Button(action: {}, label: {
                        Image(systemName: "line.3.horizontal.decrease")
                    })
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomOrnament) {
                    HStack{
                        Button(action: {
                            if self.audiosettings.audioPlayer?.currentItem?.currentTime().seconds ?? 0 > 0{
                                self.audiosettings.seek(to: CMTimeMakeWithSeconds(CMTimeGetSeconds((self.audiosettings.audioPlayer?.currentItem?.currentTime())!).advanced(by: -10), preferredTimescale: 1))
                            }
                        }) {
                            Image(systemName: "backward.fill")
                        }
                        
                        Button(action: {
                            if let player = selectedAlbum{
                                if player.isPlaying{
                                    self.audiosettings.pauseSound()
                                } else {
                                    self.audiosettings.playSound(url: selectedAlbum!.audioUrl)
                                    self.audiosettings.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                                }
                                selectedAlbum?.isPlaying.toggle()
                            }
                            
                        }) {
                            Image(systemName: selectedAlbum?.isPlaying ?? false ? "pause.fill": "play.fill")
                        }
                        
                        Button(action: {
                            self.audiosettings.seek(to: CMTimeMakeWithSeconds(CMTimeGetSeconds((self.audiosettings.audioPlayer?.currentItem?.currentTime())!).advanced(by: 10), preferredTimescale: 1))
                        }) {
                            Image(systemName: "forward.fill")
                        }
                        
                        PlayingSongCardView(viewModel: .init(player: self.audiosettings), selectedAlbum: $selectedAlbum, player: self.audiosettings)
                        
                        Button(action: {}) {
                            Image(systemName: "quote.bubble")
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "list.bullet")
                        }
                        
                        Button(action: {
                            isMuted.toggle()
                            self.audiosettings.audioPlayer?.volume = isMuted ? 0.0 : 1.0
                        }) {
                            Image(systemName: isMuted ? "speaker.fill" : "speaker.wave.3.fill")
                        }
                        
                    }.padding(.vertical, 8)
                }
            }
    }
    
    func updatemusic(album: Album){
        if !album.isPlaying{
            self.audiosettings.pauseSound()
            self.selectedAlbum?.isPlaying = false
            self.audiosettings.audioPlayer = nil
        }
    }
    
    func getLatestMusic() -> [Album]{
        var albumsArray = albums
        if sideMenu.isAlbum{
            albumsArray = albums
        }
        else if sideMenu.isSongs{
            albumsArray = songs
        }
        else if sideMenu.isMadeForYou{
            albumsArray = madeForYou
        }
        else if sideMenu.isRecentlyAdded{
            albumsArray = recent
        }else{
            albumsArray = recent
        }
        return albumsArray
    }
}



