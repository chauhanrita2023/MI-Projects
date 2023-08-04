//
//  ContentView.swift
//  MI-MusicVisionPro
//
//  Created by Mind on 02/08/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    //MARK: - IVARS....
    @State private var searchText: String = ""
    @State private var selectedSideMenu: SideMenuStruct? = SideMenuStruct.recentlyAdded
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 150, maximum: 200))]
    @State var audiosettings = audioSettings()
    
    //MARK: - MAIN CODE FOR SHOW MUSIC LIST WITH SIDE MENU....
    var body: some View {
        TabView {
            NavigationSplitView {
                SideBarView(selectedSideMenu: $selectedSideMenu)
                Spacer()
            } detail: {
                AlbumsView(sideMenu: selectedSideMenu!)
            }.tabItem {
                Label("Browse", systemImage: "music.note")
            }.tag(0)
            
            Text("Favorite")
                .tabItem {
                    Label("Favorite", systemImage: "heart.fill")
                }.tag(1)
            
            Text("Playlist")
                .tabItem {
                    Label("Playlist", systemImage: "play.square.stack")
                }.tag(2)
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}

