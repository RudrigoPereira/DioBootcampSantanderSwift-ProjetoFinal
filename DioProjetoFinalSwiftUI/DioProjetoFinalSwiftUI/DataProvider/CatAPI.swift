//
//  CatAPI.swift
//  DioProjetoFinalSwiftUI
//
//  Created by Rodrigo Ferreira Pereira on 19/10/23.
//

import Foundation
import Combine

struct CatAPI {
    static func getCatImages() -> AnyPublisher<[CatImageModel], Error> {
        let endpoint = "https://api.thecatapi.com/v1/images/search"
        let url = URL(string: endpoint)!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [CatImageModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
