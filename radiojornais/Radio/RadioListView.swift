//
//  RadioListView.swift
//  radiojornais
//
//  Created by Paul Fitzgerald on 14/04/2023.
//


import SwiftUI

struct RadioListView: View {
    @ObservedObject var fetcher = RadioFetcher()
    
    var soundManager: SoundManager
    @Binding var favourites: [FavoriteItem]
    let saveFavourites: () -> Void
    
    @State var showingRadioStationSheet = false

    var body: some View {
        NowPlayingBar(content: NavigationStack {
            List {
                ForEach(fetcher.radioStations, id: \.name) { radioStation in
                    HStack {
                        AsyncImage(url: URL(string: radioStation.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 25.0, height: 25.0)
                        .clipShape(RoundedRectangle(cornerRadius: 4.0))
                        
                        NavigationLink(radioStation.name) {
                            RadioStationView(radioStation: radioStation, soundManager: soundManager, isBuffering: soundManager.isBuffering, favourites: $favourites, saveFavourites: saveFavourites, showingRadioStationSheet: $showingRadioStationSheet)
                         }
                    }
                }
            }
            .navigationTitle("Rádio")
        }
        .accentColor(.black), soundManager: soundManager)
    }
}


public class RadioFetcher: ObservableObject {
    @Published var radioStations = [RadioStation]()
    
    init(){
        load()
    }
    
    func load() {
        let url = URL(string: "https://mocki.io/v1/82a06031-d59b-4f87-b109-9c4db69d4f39")
        
        URLSession.shared.dataTask(with: url!) {(data,response,error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([RadioStation].self, from: d)
                    DispatchQueue.main.async {
                        self.radioStations = decodedLists
                    }
                } else {
                    print("No Data")
                }
            } catch {
                print ("Error")
            }
            
        }.resume()
        
    }
}
