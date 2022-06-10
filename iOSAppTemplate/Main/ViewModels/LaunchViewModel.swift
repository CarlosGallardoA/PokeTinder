//
//  LaunchViewModel.swift
//  iOSAppTemplate
//
//  Created by Carlos Enrique Gallardo Ambrosio on 10/06/22.
//

import Foundation

class LaunchViewModel: ObservableObject {
    //instanciar appState
    let appState = AppState.shared
    init() {
        appState.currentScreen = .home
    }
}
