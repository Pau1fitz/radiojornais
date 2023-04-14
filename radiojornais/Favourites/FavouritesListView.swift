//
//  FavouritesListView.swift
//  radiojornais
//
//  Created by Paul Fitzgerald on 14/04/2023.
//

import SwiftUI

struct FavouritesListView: View {
    var soundManager: SoundManager
    @Binding var favourites: [FavoriteItem]
    let saveFavourites: () -> Void
    
    @State private var showingRadioStationSheet = false
    @State private var radioStationDisplayedIndex: Int? = nil

    var body: some View {
        let allPublications = sportPublications + fashionPublications + generalPublications
        let favouritePublications = allPublications.filter { favourites.map({$0.name}).contains($0.name) }
        let favouriteRadioStations = radioStations.filter { favourites.map({$0.name}).contains($0.name) }
        
        NowPlayingBar(content: VStack {
            NavigationStack {
                
                if favouriteRadioStations.count == 0 && favouritePublications.count == 0 {
                    VStack {
                        Spacer()
                        Text("Please add to favourites")
                        Spacer()
                    }
                }
                
                List {
                    if favouriteRadioStations.count > 0 {
                        Section {
                            ForEach(favouriteRadioStations, id: \.name) { item in
                                HStack {
                                    Image(item.logo)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                    Text(item.name)
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .background(Color(UIColor.systemBackground).opacity(0.95))
                                .onTapGesture {
                                    radioStationDisplayedIndex = favouriteRadioStations.firstIndex(where: { $0.name == item.name })
                                    showingRadioStationSheet = true
                                }
                            }
                        }
                        header: {
                            Text("Rádio")
                        }
                        
                    }
                    
                    
                    if favouritePublications.count > 0 {
                        Section {
                            ForEach(favouritePublications, id: \.name) { item in
                                HStack {
                                    AsyncImage(url: URL(string: item.image)) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 25.0, height: 25.0)
                                    .clipShape(RoundedRectangle(cornerRadius: 4.0))
                                    
                                    NavigationLink(item.name) {
                                        PublicationView(publication: item, favourites: $favourites, saveFavourites: saveFavourites)
                                    }
                                }
                            }
                        }
                        header: {
                                Text("Jornais")
                            }
                    }
                }
                .navigationTitle("Favoritos")
            }
            .accentColor(.black)
        }.sheet(isPresented: $showingRadioStationSheet) {
            NowPlayingBar(content: RadioStationView(radioStation: favouriteRadioStations[radioStationDisplayedIndex!], soundManager: soundManager, isBuffering: soundManager.isBuffering, favourites: $favourites, saveFavourites: saveFavourites, showingRadioStationSheet: $showingRadioStationSheet), soundManager: soundManager)
        }, soundManager: soundManager)
    }
}


