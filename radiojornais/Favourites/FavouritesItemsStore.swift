//
//  FavouritesItemsStore.swift
//  radiojornais
//
//  Created by Paul Fitzgerald on 14/04/2023.
//

import Foundation
import SwiftUI

class FavouritesItemsStore: ObservableObject {
    @Published var favourites: [FavoriteItem] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil,
                                       create: false)
            .appendingPathComponent("favouriteItems.data")
    }
    
    static func load(completion: @escaping (Result<[FavoriteItem], Error>)->Void) {

         DispatchQueue.global(qos: .background).async {
             do {
                 let fileURL = try fileURL()
                 guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                     DispatchQueue.main.async {
                         completion(.success([]))
                     }
                     return
                 }
                 
                 let favourites = try JSONDecoder().decode([FavoriteItem].self, from: file.availableData)
                 DispatchQueue.main.async {
                     completion(.success(favourites))
                 }
             } catch {
                 DispatchQueue.main.async {
                     completion(.failure(error))
                 }
             }
         }
     }
    
    static func save(favouriteItems: [FavoriteItem], completion: @escaping (Result<Int, Error>)->Void) {
        print("favouriteItems")
        print(favouriteItems)
        DispatchQueue.global(qos: .background).async {
            do {
                let data = try JSONEncoder().encode(favouriteItems)
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(favouriteItems.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
