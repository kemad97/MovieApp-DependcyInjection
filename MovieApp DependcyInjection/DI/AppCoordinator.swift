//
//  AppCoordinator.swift
//  MovieApp DependcyInjection
//
//  Created by Kerolos on 04/06/2025.
//

import Foundation
import UIKit
import SwiftUI

class AppCoordinator {
    func start() -> UIViewController {
        let movieService = MovieService()
        let fetchMoviesUseCase = FetchMoviesUseCase(movieService: movieService)
        let viewModel = MovieListViewModel(fetchMoviesUseCase: fetchMoviesUseCase)
        let movieListView = MovieListView(viewModel: viewModel)
        return UIHostingController(rootView: movieListView)
    }
}
