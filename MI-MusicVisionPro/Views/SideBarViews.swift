//
//  SideBarViews.swift
//  MI-MusicVisionPro
//
//  Created by Mind on 02/08/23.
//

import SwiftUI

struct SideBarView: View {
    
    //MARK: - IVARS....
    private let sideMenu = SideMenuStruct.listAll
    @Binding var selectedSideMenu: SideMenuStruct?
    @ObservedObject var audiosettings = audioSettings()
    
//    var stopLastPlayingItem:(()->Void)
    
    //MARK: - HERE IS FULL UI OF SIDEMENU AND TAPPED ON ITEM MAIN CONTENT WILL UPDATE ACCORDINGLY...
    var body: some View {
        List(sideMenu, selection: $selectedSideMenu) { item in
            Button {
                selectedSideMenu = self.updateCurrentMenu(selectedSideMenu: item)
//                stopLastPlayingItem()
            } label: {
                VStack(spacing: 0){
                    HStack(spacing: 0){
                        Label(item.name, systemImage: item.icon)
                            .foregroundStyle(.primary)
                        Spacer()
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(selectedSideMenu?.name == item.name ? .white.opacity(0.7) : .clear)
                .cornerRadius(10)
            }
            
        }.toolbar {
            ToolbarItem(placement: .topBarLeading) {
                VStack(alignment: .leading, content: {
                    Text("Library")
                        .font(.largeTitle)
                    Text("All Music")
                        .foregroundStyle(.tertiary)
                })
            }
            ToolbarItem{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "ellipsis")
                })
            }
        }
    }
    
    //MARK: - IT'S METHOD WILL RETURN UPDATED CONTENT OF SELECTED SIDEMENU....
    func updateCurrentMenu(selectedSideMenu:SideMenuStruct) -> SideMenuStruct {
        var selectedSideMenu : SideMenuStruct = selectedSideMenu
        if selectedSideMenu.name == "Recently Added"{
            selectedSideMenu = recentlyAddedStruct
        }
        else if selectedSideMenu.name == "Artists"{
            selectedSideMenu = artistsStruct
        }
        else if selectedSideMenu.name == "Albums"{
            selectedSideMenu = albumsStruct
        }
        else if selectedSideMenu.name == "Songs"{
            selectedSideMenu = songsStruct
        }else{
            selectedSideMenu = madeForYouStruct
        }
        return selectedSideMenu
    }
}
