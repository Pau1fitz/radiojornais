//
//  FavouriteItem.swift
//  radiojornais
//
//  Created by Paul Fitzgerald on 14/04/2023.
//

import Foundation

struct FavoriteItem: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
    var type: String
    var logo: String
    
    init(id: UUID = UUID(), name: String, type: String, logo: String) {
        self.id = id
        self.name = name
        self.type = type
        self.logo = logo
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(type)
        hasher.combine(logo)
    }
}
