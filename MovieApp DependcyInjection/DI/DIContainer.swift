//
//  AppCoordinator.swift
//  MovieApp DependcyInjection
//
//  Created by Kerolos on 04/06/2025.
//

import SwiftUI

class DIContainer {
    static let shared = DIContainer()
    private var registry: [String: Any] = [:]
    
    private init() {
        registerDependencies()
    }
    
    private func registerDependencies() {
        let movieService = MovieService()
        let fetchMoviesUseCase = FetchMoviesUseCase(movieService: movieService)
        let viewModel = MovieListViewModel(fetchMoviesUseCase: fetchMoviesUseCase)
        
        registry[String(describing: MovieServiceProtocol.self)] = movieService
        registry[String(describing: FetchMoviesUseCaseProtocol.self)] = fetchMoviesUseCase
        registry[String(describing: MovieListViewModel.self)] = viewModel
    }
    
    func resolve<T>(_ type: T.Type) -> T {
        let key = String(describing: type)
        guard let resolved = registry[key] as? T else {
            fatalError("Failed to resolve \(key)")
        }
        return resolved
    }
}
