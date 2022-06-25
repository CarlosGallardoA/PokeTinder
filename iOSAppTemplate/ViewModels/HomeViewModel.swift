//
//  HomeViewModel.swift
//  iOSAppTemplate
//
//  Created by Linder Anderson Hassinger Solano    on 5/06/22.
//


import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class HomeViewModel: ObservableObject {
    
    let url = "https://pokeapi.co/api/v2/pokemon?limit=50"
    
    let db = Firestore.firestore()
    
    @Published var pokemons = [Result]()
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""
    
    var pokemonFirebase = [Result]()
    
    func loadData() async {
        do {
            let url = URL(string: url)!
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(Pokemon.self, from: data)
   
            for pokemon in response.results {
                if !pokemonFirebase.contains(where: {$0.name == pokemon.name}) {
                    self.pokemons.append(pokemon)
                }
            }
        } catch let error {
            showError = true
            errorMessage = error.localizedDescription
        }
    }
    
    func getPokemonByUserId() {
        let uid = (Auth.auth().currentUser?.uid)!
        
        db.collection("pokemon").getDocuments { querySnapShot, err in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            for document in querySnapShot!.documents {
                let data = document.data()
                if data["uid"]  as! String == String(uid) {
                    self.pokemonFirebase.append(Result(name: data["name"] as! String, url: data["url"] as! String))
                }
            }
            
            Task {
                await self.loadData()
            }
        }
    }
    
    func savePokemon(name: String, url: String, like: Bool = false) {
        let uid = Auth.auth().currentUser?.uid
    
        db.collection("pokemon").addDocument(data: [
            "name" : name,
            "url"  : url,
            "like" : like,
            "uid"  : String(uid!)
        ]) { err in
            if let err = err {
                self.showError = true
                self.errorMessage = err.localizedDescription
            }
        }
    }
}


