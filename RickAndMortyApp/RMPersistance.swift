//
//  Persistence.swift
//  RickAndMortyApp
//
//  Created by Ruben Alonso on 16/6/23.
//

import Foundation

enum NetworkErrors: String, Error {
    case badResponse = "Wrong answer server"
    case notFound = "Not found the URL"
    case failedToParseData = "Failure to decode the data"
    case unknow = "Unknown error"
    case badParse = "Failure to parse"
}

protocol NetworkPersistence {
    func loadRM() async throws -> [ResultsModel]
}

final class RMPersistance: NetworkPersistence {
    static let shared = RMPersistance()
    
    private init() {}
    
    func loadRM() async throws -> [ResultsModel] {
        let (data, response) = try await URLSession.shared.data(for: .getRequest(url: .getCharacters))
        guard let httpResponse = response as? HTTPURLResponse else { throw NetworkErrors.badResponse }//casteamos para tener el statusCode
        
        switch httpResponse.statusCode {
        case 200...299:
            do {
                return try JSONDecoder().decode([ResultsModel].self, from: data)
            } catch {
                throw NetworkErrors.failedToParseData
            }
        case 400...450:
            throw NetworkErrors.notFound
        case 500...550:
            throw NetworkErrors.notFound
        }
    }
}
