//
//  MovieListViewModel.swift
//  MovieApp DependcyInjection
//
//  Created by Kerolos on 04/06/2025.
//

import Foundation

class MovieListViewModel:ObservableObject{
    
    private let fetchMoviesUseCase: FetchMoviesUseCaseProtocol
    @Published var movies : [Movie] = [ ]
    
    init(fetchMoviesUseCase: FetchMoviesUseCaseProtocol) {
            self.fetchMoviesUseCase = fetchMoviesUseCase
        }
    
    func fetchMovies() {
            fetchMoviesUseCase.execute { [weak self] movies in
                self?.movies = movies
            }
        }
    
    
    
}
