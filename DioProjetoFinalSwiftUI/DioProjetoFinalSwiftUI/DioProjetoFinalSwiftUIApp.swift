//
//  DioProjetoFinalSwiftUIApp.swift
//  DioProjetoFinalSwiftUI
//
//  Created by Rodrigo Ferreira Pereira on 19/10/23.
//

import SwiftUI

@main
struct DioProjetoFinalSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            CatListView(viewModel: CatListViewModel())
        }
    }
}
