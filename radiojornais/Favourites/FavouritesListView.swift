//
//  FavouritesListView.swift
//  radiojornais
//
//  Created by Paul Fitzgerald on 14/04/2023.
//

import SwiftUI

struct FavouritesListView: View {
    @Binding var favourites: [FavoriteItem]

    var body: some View {
        
        let _ = print(favourites)
        
        VStack (alignment: .leading) {
            Text("Favoritos")
                .font(.system(size: 32, weight: .bold))
                .padding()
            
            Divider()
            
            List {
               ForEach(favourites, id: \.id) { item in
                   HStack {
                       Image(item.logo)
                           .resizable()
                           .scaledToFit()
                           .frame(width: 40, height: 40)
                       
                       VStack(alignment: .leading) {
                           Text(item.name)
                               .fontWeight(.regular)
                               .font(.system(size: 16.0))
                               .offset(x: 12.0)
                       }
                       .padding(.vertical, 6.0)
                   }
                 
               }
               .onDelete { indexSet in
                   favourites.remove(atOffsets: indexSet)
                }
               .listRowInsets(EdgeInsets())
           }
           .listStyle(PlainListStyle())
        }

    }
}


