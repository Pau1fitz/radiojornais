//
//  PublicationView.swift
//  radiojornais
//
//  Created by Paul Fitzgerald on 14/04/2023.
//

import SwiftUI

struct PublicationView: View {
    let publication: Publication
    @Binding var favourites: [FavoriteItem]
    let saveFavourites: () -> Void
    
    var body: some View {
        let favouriteNames = favourites.map { $0.name }
        
        let webview = WebView(web: nil, request: URLRequest(url: publication.url))
        
        NavigationStack {
            webview
        }
        .ignoresSafeArea()
        .toolbar {
            Button(action: {
                webview.goBack()
            }) {
                Image(systemName: "arrow.backward.circle")
                    .foregroundColor(.black)
            }

            Button(action: {
                webview.goBack()
            }) {
                Image(systemName: "arrow.forward.circle")
                    .foregroundColor(.black)
            }
            
            
            Button(action: {
                if favouriteNames.contains(publication.name) {
                    if let index = favourites.firstIndex(where: { $0.name == publication.name }) {
                        favourites.remove(at: index)
                    }
                } else {
                    favourites.append(FavoriteItem(name: publication.name, type: "news", logo: "rfm"))
                }
                
                saveFavourites()
            }) {
                Image(systemName: favouriteNames.contains(publication.name) ? "star.circle.fill" : "star.circle")
                    .foregroundColor(.black)
            }
        }
    }
}
