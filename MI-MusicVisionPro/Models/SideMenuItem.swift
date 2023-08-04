//
//  SideMenuItem.swift
//  VisionProMusicApp
//  MI-MusicVisionPro
//
//  Created by Mind on 02/08/23.
//
import Foundation

//MARK: - STRUCT OF Album...
struct Album: Identifiable,Hashable,Codable {
    var id = UUID()
    var image: String
    var title: String
    var subTitle: String
    var isPlaying: Bool = false
    var audioUrl: String = "http://commondatastorage.googleapis.com/codeskulptor-demos/DDR_assets/Sevish_-__nbsp_.mp3"
}

//MARK: - LIST OF ALBUMS...
let albums: [Album] = [
    Album(image: "music1", title: "Sounds of Summer", subTitle: "The Beach Boys"),
    Album(image: "music2", title: "Overexposed", subTitle: "Maroon 5"),
    Album(image: "music3", title: "Dreamland", subTitle: "Glass Animals"),
    Album(image: "music4", title: "Modern Love (Chennai)", subTitle: "Yuvan Shankar Raja, Ila.."),
    Album(image: "music5", title: "Formula 1 Theme", subTitle: "Brian Tyler"),
    Album(image: "music6", title: "Ved", subTitle: "Ritviz")
]

let recent: [Album] = [
    Album(image: "music1", title: "Sounds of Summer", subTitle: "The Beach Boys"),
    Album(image: "music2", title: "Overexposed", subTitle: "Maroon 5"),
    Album(image: "music3", title: "Dreamland", subTitle: "Glass Animals"),
    Album(image: "music4", title: "Modern Love (Chennai)", subTitle: "Yuvan Shankar Raja, Ila.."),
    Album(image: "music5", title: "Formula 1 Theme", subTitle: "Brian Tyler")
]

let songs: [Album] = [
    Album(image: "music1", title: "Sounds of Summer", subTitle: "The Beach Boys"),
    Album(image: "music2", title: "Overexposed", subTitle: "Maroon 5"),
    Album(image: "music3", title: "Dreamland", subTitle: "Glass Animals"),
    Album(image: "music4", title: "Modern Love (Chennai)", subTitle: "Yuvan Shankar Raja, Ila..")
]

let madeForYou: [Album] = [
    Album(image: "music1", title: "Sounds of Summer", subTitle: "The Beach Boys"),
    Album(image: "music2", title: "Overexposed", subTitle: "Maroon 5"),
    Album(image: "music3", title: "Dreamland", subTitle: "Glass Animals")
]

//MARK: - STRUCT OF SIDEMENU ITEM...
struct SideMenuItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var icon: String
}

let sideMenuItems: [SideMenuItem] = [
    SideMenuItem(name: "Recently Added", icon: "clock"),
    SideMenuItem(name: "Artists", icon: "music.mic"),
    SideMenuItem(name: "Albums", icon: "square.stack"),
    SideMenuItem(name: "Songs", icon: "music.note"),
    SideMenuItem(name: "Made For You", icon: "person.crop.square"),
]

//MARK: - STRUCT OF SIDE MENU CONTAINS COLLECTION OF MUSIC...
struct MenuItem: Identifiable, Hashable {
    var id = UUID()
    var menuId : Int = 0
    var name : String
    var subTitle : String = ""
    var image: String
    var subMenuItems: [MenuItem]?
}

let topMenuItems = [ MenuItem(menuId: 1, name: "Recent Added", image: "clock", subMenuItems: subMenuArray),
                     MenuItem(menuId: 2, name: "Artists", image: "music.mic", subMenuItems: subMenuArray),
                     MenuItem(menuId: 3, name: "Albums", image: "square.stack", subMenuItems: subMenuArray),
                     MenuItem(menuId: 4, name: "Songs", image: "music.note", subMenuItems: subMenuArray),
                     MenuItem(menuId: 5, name: "Made For You", image: "person.crop.square", subMenuItems: subMenuArray)
]

let subMenuArray : [MenuItem] = [
    MenuItem(name: "Blue Neighbourhood", subTitle: "Troye Sivan", image: "music1"),
    MenuItem(name: "Not Another", subTitle: "Olivia De Silva", image: "music2"),
    MenuItem(name: "Coming Together", subTitle: "El Diablo", image: "music3"),
    MenuItem(name: "Bitches Brew", subTitle: "Miles Davis", image: "music4"),
    MenuItem(name: "Here Comes Trouble", subTitle: "Dr.Mic", image: "music5"),
    MenuItem(name: "Alone", subTitle: "Soo Jin", image: "music6"),
    MenuItem(name: "Level High", subTitle: "Porter Robinson", image: "music7"),
    MenuItem(name: "Legends Never Die", subTitle: "Dan Juice", image: "music8")
]

struct LibraryModel {
    let mainMenuItems = {
        // Top menu items
        let topMenuItems = topMenuItems
        
//        // Sub-menu items for Espresso Machines
//        let espressoMachineMenuItems = [
//            MenuItem(menuId: 1, name: "Blue Neighbourhood", subTitle: "Troye Sivan", image: "music1"),
//            MenuItem(menuId: 1, name: "Not Another", subTitle: "Olivia De Silva", image: "music2"),
//            MenuItem(menuId: 1, name: "Coming Together", subTitle: "El Diablo", image: "music3"),
//            MenuItem(menuId: 1, name: "Bitches Brew", subTitle: "Miles Davis", image: "music4"),
//            MenuItem(menuId: 1, name: "Here Comes Trouble", subTitle: "Dr.Mic", image: "music5"),
//            MenuItem(menuId: 1, name: "Alone", subTitle: "Soo Jin", image: "music6"),
//            MenuItem(menuId: 1, name: "Level High", subTitle: "Porter Robinson", image: "music7"),
//            MenuItem(menuId: 1, name: "Legends Never Die", subTitle: "Dan Juice", image: "music8")
//        ]
//        
//        // Sub-menu items for Grinder
//        let grinderMenuItems = [
//            MenuItem(menuId: 2, name: "Blue Neighbourhood", subTitle: "Troye Sivan", image: "music1"),
//            MenuItem(menuId: 2, name: "Not Another", subTitle: "Olivia De Silva", image: "music2"),
//            MenuItem(menuId: 2, name: "Coming Together", subTitle: "El Diablo", image: "music3"),
//            MenuItem(menuId: 2, name: "Bitches Brew", subTitle: "Miles Davis", image: "music4"),
//            MenuItem(menuId: 2, name: "Here Comes Trouble", subTitle: "Dr.Mic", image: "music5"),
//            MenuItem(menuId: 2, name: "Alone", subTitle: "Soo Jin", image: "music6"),
//            MenuItem(menuId: 2, name: "Level High", subTitle: "Porter Robinson", image: "music7"),
//            MenuItem(menuId: 2, name: "Legends Never Die", subTitle: "Dan Juice", image: "music8")
//        ]
//        
//        // Sub-menu items for other equipment
//        let otherMenuItems = [
//            MenuItem(menuId: 3, name: "Blue Neighbourhood", subTitle: "Troye Sivan", image: "music1"),
//            MenuItem(menuId: 3, name: "Not Another", subTitle: "Olivia De Silva", image: "music2"),
//            MenuItem(menuId: 3, name: "Coming Together", subTitle: "El Diablo", image: "music3"),
//            MenuItem(menuId: 3, name: "Bitches Brew", subTitle: "Miles Davis", image: "music4"),
//            MenuItem(menuId: 3, name: "Here Comes Trouble", subTitle: "Dr.Mic", image: "music5"),
//            MenuItem(menuId: 3, name: "Alone", subTitle: "Soo Jin", image: "music6"),
//            MenuItem(menuId: 3, name: "Level High", subTitle: "Porter Robinson", image: "music7"),
//            MenuItem(menuId: 3, name: "Legends Never Die", subTitle: "Dan Juice", image: "music8")
//        ]
        
        return topMenuItems
    }()
    
    func subMenuItems(for id: UUID) -> [MenuItem]? {
        guard let menuItem = topMenuItems.first(where: { $0.id == id }) else {
            return nil
        }
        
        return menuItem.subMenuItems
    }
    
    func menuItem(for categoryID: UUID, itemID: UUID) -> MenuItem? {
        
        guard let subMenuItems = subMenuItems(for: categoryID) else {
            return nil
        }
        
        guard let menuItem = subMenuItems.first(where: { $0.id == itemID }) else {
            return nil
        }
        
        return menuItem
    }
}
