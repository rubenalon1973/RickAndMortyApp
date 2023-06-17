//
//  Interface.swift
//  RickAndMortyApp
//
//  Created by Ruben Alonso on 17/6/23.
//

import Foundation
//capa de configuración de llamadas
let mainURL = URL(string: "https://rickandmortyapi.com/api")!

//creamos url en sist. para llamarlas más fáciles
extension URL {
    static let getCharacters = mainURL.appending(path: "character")
    static let getEpisodes = mainURL.appending(path: "episodes")
    static let getLocations = mainURL.appending(path: "location")
}

extension URLRequest {
    
    static func getRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.timeoutInterval = 10
        request.setValue("application/json", forHTTPHeaderField: "Accept")//para sólo aceptemos json del servidor
        return request
    }
}
