//
//  RMModel.swift
//  RickAndMortyApp
//
//  Created by Ruben Alonso on 16/6/23.
//

import Foundation

struct ResultsModel: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let created: Date
}

struct Origin {
    let name: String
    let url: String
}

struct Location {
    let name: String
    let url: String
}
