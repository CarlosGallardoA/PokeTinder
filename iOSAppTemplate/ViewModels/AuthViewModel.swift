//
//  AuthViewModel.swift
//  iOSAppTemplate
//
//  Created by Carlos Enrique Gallardo Ambrosio on 17/06/22.
//

import SwiftUI
import FirebaseAuth
class AuthViewModel: ObservableObject {
    @StateObject var appState: AppState = AppState.shared
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    func login(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { authResponse, error in
            if error != nil {
                self.showError = true
                self.errorMessage = error!.localizedDescription
                return
            }
                self.appState.currentScreen = .main
        }
    }
    func register(email: String, password: String, name: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResponse, error in
            if error != nil {
                self.showError = true
                self.errorMessage = error!.localizedDescription
                return
            }
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = name
                changeRequest?.commitChanges()
                self.appState.currentScreen = .main
        }
    }
}
