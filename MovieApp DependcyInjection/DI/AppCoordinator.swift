//
//  AppCoordinator.swift
//  MovieApp DependcyInjection
//
//  Created by Kerolos on 04/06/2025.
//

import SwiftUI

class AppCoordinator {
    func start() -> some View {
        let movieService = MovieService()
        let fetchMoviesUseCase = FetchMoviesUseCase(movieService: movieService)
        let viewModel = MovieListViewModel(fetchMoviesUseCase: fetchMoviesUseCase)
        return ContentView(viewModel: viewModel)
    }
}
