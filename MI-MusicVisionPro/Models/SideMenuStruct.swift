//
//  AssetClassModel.swift
//  MI-MusicVisionPro
//
//  Created by Mind on 02/08/23.
//
import SwiftUI

//MARK: - STRUCT OF SIDEMENU...
struct SideMenuStruct: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var icon: String
}

//MARK: - ALL SIDEMENU VARIABLES........
var recentlyAddedStruct = SideMenuStruct(name: "Recently Added", icon: "clock")
var artistsStruct = SideMenuStruct(name: "Artists", icon: "music.mic")
var albumsStruct = SideMenuStruct(name: "Albums", icon: "square.stack")
var songsStruct = SideMenuStruct(name: "Songs", icon: "music.note")
var madeForYouStruct = SideMenuStruct(name: "Made For You", icon: "person.crop.square")

extension SideMenuStruct {
    
    //MARK: - LIST OF SIDEMENU ITEMS....
    static var listAll: [SideMenuStruct] {
        [
            recentlyAddedStruct,
            artistsStruct,
            albumsStruct,
            songsStruct,
            madeForYouStruct
        ]
    }
    
    static var recentlyAdded: SideMenuStruct {
        return recentlyAddedStruct
    }
    
    static var artists: SideMenuStruct {
        return artistsStruct
    }
    
    static var album: SideMenuStruct {
        return albumsStruct
    }
    
    static var songs: SideMenuStruct {
        return songsStruct
    }
    
    static var madeForYou: SideMenuStruct {
        return madeForYouStruct
    }
    
    // TODO: better way?
    var isRecentlyAdded: Bool {
        return self.id == recentlyAddedStruct.id
    }
    
    var isArtists: Bool {
        return self.id == artistsStruct.id
    }
    
    var isAlbum: Bool {
        return self.id == albumsStruct.id
    }
    
    var isSongs: Bool {
        return self.id == songsStruct.id
    }
    
    var isMadeForYou: Bool {
        return self.id == madeForYouStruct.id
    }
}
