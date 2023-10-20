//
//  CatListViewModel.swift
//  DioProjetoFinalSwiftUI
//
//  Created by Rodrigo Ferreira Pereira on 19/10/23.
//

import Foundation
import Combine

class CatListViewModel: ObservableObject {
    @Published var catImages: [CatImageModel] = []
    
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchCatImages() {
        CatAPI.getCatImages()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] catImages in
                self?.catImages = catImages
            })
            .store(in: &cancellables)
    }
}
