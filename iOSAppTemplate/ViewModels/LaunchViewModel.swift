//
//  LaunchViewModel.swift
//  iOSAppTemplate
//
//  Created by Carlos Enrique Gallardo Ambrosio on 10/06/22.
//

import Foundation
import FirebaseAuth
class LaunchViewModel: ObservableObject {
    //instanciar appState
    let appState = AppState.shared
    init() {
        appState.currentScreen = Auth.auth().currentUser != nil ? .main : .login
    }
}
