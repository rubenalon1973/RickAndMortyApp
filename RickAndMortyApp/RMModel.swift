//
//  RMModel.swift
//  RickAndMortyApp
//
//  Created by Ruben Alonso on 16/6/23.
//

import Foundation

struct RMModel: Codable {
    let characters: Characters
    let episodes: Episodes
    let locations: Locations

}

struct Characters: Codable {
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
        let created: String
}

struct Location: Codable {
    let name: String
    let url: String
}

struct Origin: Codable {
    let name: String
    let url: String
}

struct Episodes: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}

struct Locations: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
