//
//  CardView.swift
//  iOSAppTemplate
//
//  Created by Carlos Enrique Gallardo Ambrosio on 10/06/22.
//

import SwiftUI

struct CardView: View {
    
    @StateObject var homeViewModel = HomeViewModel()
    @State private var offset = CGSize.zero
    
    var pokemon: Result
    
    var body: some View {
        ZStack {
            Image("bg-poke")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 300)
            AsyncImage(url: URL(string: setImageFromUrl(url: pokemon.url)), scale: 1.5)
            VStack {
                Text(pokemon.name.capitalized)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                    .font(.system(size : 23, weight: .bold))
                HStack {
                    Image(systemName: "location")
                        .foregroundColor(.white)
                        .font(.system(size : 16, weight: .bold))
                    Text("Pueblo Paleta")
                        .foregroundColor(.white)
                        .font(.system(size : 16, weight: .bold))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .cornerRadius(15)
        .padding()
        .offset(x: offset.width * 1, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 40)))
        .gesture(
            DragGesture()
                .onChanged({ gesture in
                    offset = gesture.translation
                })
                .onEnded({ _ in
                    withAnimation {
                        swipeCard(width: offset.width)
                    }
                })
        )
    }
    
    func setImageFromUrl(url: String) -> String {
        let id = url.components(separatedBy: "/").filter({$0 != ""}).last!
   
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(id).png"
    }
    
    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-150):
            print("remove")
            offset = CGSize(width: -500, height: 0)
            homeViewModel.savePokemon(name: pokemon.name, url: pokemon.url)
        case 150...500:
            print("add")
            homeViewModel.savePokemon(name: pokemon.name, url: pokemon.url, like: true)
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(pokemon:
                    Result(
                        name: "Pikachu",
                        url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/25.png"
                    )
        )
    }
}
