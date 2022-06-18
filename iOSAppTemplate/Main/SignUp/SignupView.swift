//
//  SignupView.swift
//  iOSAppTemplate
//
//  Created by Carlos Enrique Gallardo Ambrosio on 17/06/22.
//

import SwiftUI

struct SignupView: View {
    @StateObject var authViewModel = AuthViewModel()
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Sign Up")
                    .font(.system(size: 25, weight: .black))
                Text("Welcome to PokeTinder match your favorite pokemon")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            Spacer()
                VStack(spacing: 25) {
                    TextField("Enter your name", text: $name)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(.yellow, lineWidth: 1))
                        .keyboardType(.default)
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
                        authViewModel.register(email: email, password: password, name: name)
                    }label: {
                        Text("Sign Up")
                            .padding()
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                    }
                    .frame(maxWidth: .infinity)
                    .background(.yellow)
                    .cornerRadius(8)
                }.padding()
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
