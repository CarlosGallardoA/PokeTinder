//
//  App_iOS.swift
//  iOSAppTemplate
//
//  Created by Linder Anderson Hassinger Solano    on 5/06/22.
//

import SwiftUI

@main
struct MyApp_iOS: App {
    
    @StateObject var appState: AppState = AppState.shared
    
    var body: some Scene {
        WindowGroup {
            switch appState.currentScreen {
            case .launch:
                LaunchView()
                    .environmentObject(appState)
            case .home:
                ContentView()
                    .environmentObject(appState)
            case .options:
                ContentView()
            case .profile:
                ContentView()
            }
        }
    }
    
    
}
