//
//  ContentView.swift
//  iOSAppTemplate
//
//  Created by Linder Anderson Hassinger Solano    on 5/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack{
            CardView()
            HStack{
                HomeButtomView(imageName: "undo-button")
                HomeButtomView(imageName: "dislike-button")
                HomeButtomView(imageName: "flash-button")
                HomeButtomView(imageName: "like-button")
                HomeButtomView(imageName: "flash-button")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
