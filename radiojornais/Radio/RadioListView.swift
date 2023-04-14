//
//  RadioListView.swift
//  radiojornais
//
//  Created by Paul Fitzgerald on 14/04/2023.
//


import SwiftUI

struct RadioListView: View {
    @StateObject private var soundManager = SoundManager()
    @Binding var favourites: [FavoriteItem]
    let saveAction: () -> Void
    
    
    var body: some View {
        NowPlayingBar(content: NavigationStack {
            List {
                ForEach(radioStations, id: \.name) { radioStation in
                    HStack {
                        AsyncImage(url: URL(string: radioStation.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 25.0, height: 25.0)
                        .clipShape(RoundedRectangle(cornerRadius: 4.0))
                        
                        NavigationLink(radioStation.name) {
                            RadioStationView(radioStation: radioStation, soundManager: soundManager, isBuffering: soundManager.isBuffering, favourites: $favourites, saveAction: saveAction)
                         }
                    }
                }
            }
            .navigationTitle("Rádio")
        }
        .accentColor(.black), soundManager: soundManager)
    }
}
