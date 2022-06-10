//
//  CardView.swift
//  iOSAppTemplate
//
//  Created by Carlos Enrique Gallardo Ambrosio on 10/06/22.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            Image("bg-poke")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 300)
            Image("pikachu")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 280, height: 280, alignment: .center)
            VStack{
                Text("Pikachu, 24")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.system(size: 23, weight: .bold))
                HStack{
                    Image(systemName: "location")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                        
                    Text("Pueblo Paleta")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                        
                } .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding()
            
        }
        .frame(height: 400)
        .cornerRadius(15)
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
