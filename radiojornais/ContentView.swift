//
//  ContentView.swift
//  radiojornais
//
//  Created by Paul Fitzgerald on 14/04/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var store = FavouritesItemsStore()
    @StateObject var soundManager = SoundManager()
     
    func saveFavourites () {
        FavouritesItemsStore.save(favouriteItems: store.favourites) { result in
            if case .failure(let error) = result {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        TabView {
            JornaisListView(favourites: $store.favourites, saveFavourites: saveFavourites)
                .tabItem {
                    Label("Jornais", systemImage: "book")
                }
            
//            RadioListView(soundManager: soundManager, favourites: $store.favourites, saveFavourites: saveFavourites)
//                .tabItem {
//                    Label("Rádio", systemImage: "antenna.radiowaves.left.and.right")
//                }
            
            FavouritesListView(soundManager: soundManager, favourites: $store.favourites, saveFavourites: saveFavourites)
                .tabItem {
                    Label("Favoritos", systemImage: "star")
                }
        }
        .onAppear {
            FavouritesItemsStore.load { result in
                switch result {
                case .failure(let error):
                    fatalError(error.localizedDescription)
                case .success(let favourites):
                    store.favourites = favourites
                }
            }
        }
    }
}
