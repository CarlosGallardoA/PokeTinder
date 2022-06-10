//
//  HomeButtomView.swift
//  iOSAppTemplate
//
//  Created by Carlos Enrique Gallardo Ambrosio on 10/06/22.
//

import SwiftUI

struct HomeButtomView: View {
    var imageName = ""
    var body: some View {
        VStack {
            Button {
                print("like")
            } label: {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(maxWidth: 80, maxHeight: 80)
            
        }
    }
}

struct HomeButtomView_Previews: PreviewProvider {
    static var previews: some View {
        HomeButtomView(imageName: "dislike-button")
    }
}
