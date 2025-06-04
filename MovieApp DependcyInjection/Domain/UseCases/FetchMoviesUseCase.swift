//
//  FetchMoviesUseCase.swift
//  MovieApp DependcyInjection
//
//  Created by Kerolos on 04/06/2025.
//

import Foundation

class FetchMoviesUseCase: FetchMoviesUseCaseProtocol {
    
    private let movieService: MovieServiceProtocol
    
    init(movieService: MovieServiceProtocol) {
        self.movieService = movieService
    }
    
    func execute(completion: @escaping ([Movie]) -> Void) {
        movieService.fetchMovies(completion: completion)
    }
    
    
}
