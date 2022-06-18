//
//  SigninView.swift
//  iOSAppTemplate
//
//  Created by Carlos Enrique Gallardo Ambrosio on 17/06/22.
//

import SwiftUI

struct SigninView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var authViewModel = AuthViewModel()
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationView {
            ScrollView() {
                VStack(spacing: 15) {
                    Text("Hello Again!")
                        .font(.system(size: 25, weight: .bold))
                    Text("Welcome back you've missed")
                        .font(.system(size: 20))
                        .frame(maxWidth: 200)
                    VStack(spacing: 25) {
                        TextField("Enter your email", text: $email)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(.yellow, lineWidth: 1))
                            .keyboardType(.emailAddress)
                        SecureField("Enter your password", text: $password)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(.yellow, lineWidth: 1))
                        
                        Button {
                            authViewModel.login(email: email, password: password)
                        }label: {
                            Text("Sign In")
                                .padding()
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                        }
                        .frame(maxWidth: .infinity)
                        .background(.yellow)
                        .cornerRadius(8)
                        NavigationLink(destination: SignupView()) {
                            Text("Not a member? Register now")
                        }
                    }.padding()
                }
            }
        }.accentColor(.yellow)
    }
}

struct SigninView_Previews: PreviewProvider {
    static var previews: some View {
        SigninView()
    }
}
