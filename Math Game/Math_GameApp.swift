//
//  Math_GameApp.swift
//  Math Game
//
//  Created by Julian Dean on 6/18/21.
//

import SwiftUI

@main
struct Math_GameApp: App {
    var dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(dataManager)
        }
    }
}
