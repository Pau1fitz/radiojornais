//
//  ContentView.swift
//  radiojornais
//
//  Created by Paul Fitzgerald on 14/04/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var store = FavouritesItemsStore()
     
    func saveFavourites () {
        FavouritesItemsStore.save(favouriteItems: store.favourites) { result in
            if case .failure(let error) = result {
                fatalError(error.localizedDescription)
            }
        }
    }
    
    var body: some View {
        TabView {
            JornaisListView()
                .tabItem {
                    Label("Jornais", systemImage: "book")
                }
            
            RadioListView(favourites: $store.favourites, saveAction: saveFavourites)
                .tabItem {
                    Label("Rádio", systemImage: "antenna.radiowaves.left.and.right")
                }
            
            FavouritesListView(favourites: $store.favourites)
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
