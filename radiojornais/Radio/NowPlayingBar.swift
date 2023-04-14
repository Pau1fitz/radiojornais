//
//  NowPlayingBar.swift
//  radiojornais
//
//  Created by Paul Fitzgerald on 14/04/2023.
//

import SwiftUI

struct NowPlayingBar<Content: View>: View {
    var content: Content
    var soundManager: SoundManager
    
    @ViewBuilder var body: some View {
        ZStack(alignment: .bottom) {
            content
            if soundManager.stationPlaying != nil {
                ZStack {
                    Rectangle().foregroundColor(Color.white).frame(width: UIScreen.main.bounds.size.width, height: 60)
                        .border(width: 1.5, edges: [.top], color: .black)
                    HStack {
                        HStack {
                            AsyncImage(url: URL(string: (soundManager.stationPlaying!.image))) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 45.0, height: 45.0)
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                            .padding()
                                
                            Text((soundManager.stationPlaying!.name))

                            Spacer()
                        }
                      
                        Button(action: {
                            soundManager.playSound(radioStation: (soundManager.stationPlaying)!)
                            !soundManager.isPlaying ? soundManager.play() : soundManager.pause()
                        }) {
                            Image(systemName: soundManager.isPlaying ? "pause.fill": "play.fill")
                        }
                        .buttonStyle(PlainButtonStyle()).padding(.horizontal)
                    }
                }
                .offset(y: 10.0)
            }
        }
    }
}


