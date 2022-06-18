//
//  MainView.swift
//  iOSAppTemplate
//
//  Created by Carlos Enrique Gallardo Ambrosio on 17/06/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ChatView()
                .tabItem {
                    Label("Chat", systemImage: "message")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }.accentColor(.yellow)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
