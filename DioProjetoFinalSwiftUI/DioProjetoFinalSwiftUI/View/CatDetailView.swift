//
//  CatDetailView.swift
//  DioProjetoFinalSwiftUI
//
//  Created by Rodrigo Ferreira Pereira on 19/10/23.
//

import SwiftUI

struct CatDetailView: View {
    let catImage: CatImageModel
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: catImage.url)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else if phase.error != nil {
                    Text("Failed to load image")
                } else {
                    ProgressView()
                }
            }
        }
        .navigationTitle("Image")
    }
}

#Preview {
    CatDetailView(catImage: CatImageModel(id: "3fg", url: "https://25.media.tumblr.com/tumblr_lqik92AS4I1qfy8klo1_500.jpg"))
}
