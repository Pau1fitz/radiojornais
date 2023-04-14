//
//  RadioStationsView.swift
//  radiojornais
//
//  Created by Paul Fitzgerald on 14/04/2023.
//

import SwiftUI

struct RadioStationView: View {
    var radioStation: RadioStation
    var soundManager: SoundManager
    var isBuffering: Bool
    @Binding var favourites: [FavoriteItem]
    let saveFavourites: () -> Void
    
    var body: some View {
        let favouriteNames = favourites.map { $0.name }
        
        VStack {
            VStack {
                Spacer()
                Image(radioStation.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150.0, height: 150.0)
                        
                Spacer()
                
                if isBuffering {
                    VStack {
                        ProgressView()
                    }
                    .frame(width: 55.0, height: 55.0)
                    
                } else {
                    
                    HStack {
                        Image(systemName: soundManager.isPlaying ? "pause.circle": "play.circle")
                            .font(.system(size: 50))
                            .padding(.trailing)
                            .onTapGesture {
                                soundManager.playSound(radioStation: radioStation)
                                !soundManager.isPlaying ? soundManager.play() : soundManager.pause()
                            }
                        
                        Image(systemName: favouriteNames.contains(radioStation.name) ? "star.circle.fill" : "star.circle")
                            .font(.system(size: 50))
                            .onTapGesture {
                                if favouriteNames.contains(radioStation.name) {
                                    if let index = favourites.firstIndex(where: { $0.name == radioStation.name }) {
                                        favourites.remove(at: index)
                                    }
                                } else {
                                    favourites.append(FavoriteItem(name: radioStation.name, type: "radio", logo: radioStation.logo))
                                }
                                saveFavourites()
                            }
                    }
                }
                    
                Spacer()
            }
        }
        .onAppear {
            if soundManager.stationPlaying?.name != radioStation.name {
                soundManager.playSound(radioStation: radioStation)
                soundManager.play()
            }
        }
    }
}


