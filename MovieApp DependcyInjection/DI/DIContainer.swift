//
//  AppCoordinator.swift
//  MovieApp DependcyInjection
//
//  Created by Kerolos on 04/06/2025.
//

import SwiftUI
import Swinject
/*
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
*/



class DIContainer {
    static let shared = DIContainer()
    private let container: Container
    
    private init() {
        container = Container()
        registerDependencies()
    }
    
    private func registerDependencies() {
        container.register(MovieServiceProtocol.self) { _ in
            MovieService()
        }
        
        container.register(FetchMoviesUseCaseProtocol.self) { resolver in
            FetchMoviesUseCase(movieService: resolver.resolve(MovieServiceProtocol.self)!)
        }
        
        container.register(MovieListViewModel.self) { resolver in
            MovieListViewModel(fetchMoviesUseCase: resolver.resolve(FetchMoviesUseCaseProtocol.self)!)
        }
    }
    
    func resolve<T>(_ type: T.Type) -> T {
        guard let resolved = container.resolve(type) else {
            fatalError("Failed to resolve \(type)")
        }
        return resolved
    }
}
