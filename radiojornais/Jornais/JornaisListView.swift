//
//  JornaisListView.swift
//  radiojornais
//
//  Created by Paul Fitzgerald on 14/04/2023.
//

import SwiftUI

struct JornaisListView: View {
    @Binding var favourites: [FavoriteItem]
    let saveFavourites: () -> Void

    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(generalPublications, id: \.name) { publication in
                        HStack {
                            AsyncImage(url: URL(string: publication.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 25.0, height: 25.0)
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                            NavigationLink(publication.name) {
                                PublicationView(publication: publication, favourites: $favourites, saveFavourites: saveFavourites)
                             }
                        }
                    }
                }
                header: {
                    Text("Geral")
                }
                Section {
                    ForEach(sportPublications, id: \.name) { publication in
                        HStack {
                            AsyncImage(url: URL(string: publication.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 25.0, height: 25.0)
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                            NavigationLink(publication.name) {
                                PublicationView(publication: publication,favourites: $favourites, saveFavourites: saveFavourites)
                             }
                        }
                    }
                }
                header: {
                    Text("Desportos")
                }
                Section {
                    ForEach(fashionPublications, id: \.name) { publication in
                        HStack {
                            AsyncImage(url: URL(string: publication.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 25.0, height: 25.0)
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                            
                            NavigationLink(publication.name) {
                                PublicationView(publication: publication, favourites: $favourites, saveFavourites: saveFavourites)
                             }
                        }
                    }
                }
                header: {
                    Text("Moda")
                }
                
                Section {
                    ForEach(celebrityPublications, id: \.name) { publication in
                        HStack {
                            AsyncImage(url: URL(string: publication.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 25.0, height: 25.0)
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                            
                            NavigationLink(publication.name) {
                                PublicationView(publication: publication, favourites: $favourites, saveFavourites: saveFavourites)
                             }
                        }
                    }
                }
                header: {
                    Text("Celebridades")
                }
                
                Section {
                    ForEach(otherPublications, id: \.name) { publication in
                        HStack {
                            AsyncImage(url: URL(string: publication.image)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 25.0, height: 25.0)
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                            
                            NavigationLink(publication.name) {
                                PublicationView(publication: publication, favourites: $favourites, saveFavourites: saveFavourites)
                             }
                        }
                    }
                }
                header: {
                    Text("Outra")
                }
            }
            .navigationTitle("Jornais")
        }
        .accentColor(.black)
    }
}

