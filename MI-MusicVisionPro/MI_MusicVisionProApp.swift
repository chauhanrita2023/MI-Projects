//
//  MI_MusicVisionProApp.swift
//  MI-MusicVisionPro
//
//  Created by Mind on 02/08/23.
//

import SwiftUI

@main
struct MI_MusicVisionProApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
