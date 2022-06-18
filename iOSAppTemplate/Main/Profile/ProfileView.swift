//
//  ProfileView.swift
//  iOSAppTemplate
//
//  Created by Carlos Enrique Gallardo Ambrosio on 17/06/22.
//

import SwiftUI
import FirebaseAuth
struct ProfileView: View {
    @EnvironmentObject var appState: AppState
    @State private var user = Auth.auth().currentUser
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 15) {
                    Image("profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .frame(maxWidth: 100)
                    
                    
                    Text(user?.displayName ?? "No name")
                        .font(.system(size: 26, weight: .black))
                    Text(user?.email ?? "example@example.com")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                    HStack {
                        Button {
                            print("update")
                        } label : {
                            Text("Update profile")
                                .padding()
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                        }
                        .background(.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        Spacer()
                        Button {
                            print("Follow")
                        } label: {
                            Text("Follow")
                                .padding()
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                        }
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                }
                .padding()
                Spacer()
                VStack {
                    Divider()
                    Button {
                        try? Auth.auth().signOut()
                        appState.currentScreen = .login
                    } label : {
                        Text("Sign Out")
                            .foregroundColor(.red)
                    }
                }
                .padding()
                .padding(.bottom)
            }
            .navigationTitle("Profile")
        }
    }
}
        

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

