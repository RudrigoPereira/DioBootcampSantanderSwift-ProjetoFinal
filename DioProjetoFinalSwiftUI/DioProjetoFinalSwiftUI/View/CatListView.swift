//
//  CatListView.swift
//  DioProjetoFinalSwiftUI
//
//  Created by Rodrigo Ferreira Pereira on 19/10/23.
//

import SwiftUI

struct CatListView: View {
    @ObservedObject var viewModel: CatListViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.catImages, id: \.id) { catImage in
                NavigationLink(destination: CatDetailView(catImage: catImage)) {
                    Text("Cat Random")
                }
            }
            .onAppear {
                viewModel.fetchCatImages()
            }
            .navigationTitle("Cat Images")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CatListView(viewModel: CatListViewModel())
}
