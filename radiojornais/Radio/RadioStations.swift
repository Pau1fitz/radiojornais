//
//  RadioStations.swift
//  radiojornais
//
//  Created by Paul Fitzgerald on 14/04/2023.
//

import Foundation
import SwiftUI

struct RadioStation: Decodable {
    var name: String
    var image: String
    var url: String
    var logo: String
    var smallImage: String
    
    init(name: String, image: String, url: String, logo: String, smallImage: String) {
        self.name = name
        self.image = image
        self.url = url
        self.logo = logo
        self.smallImage = smallImage
    }
}

let radioStations: [RadioStation] = []
