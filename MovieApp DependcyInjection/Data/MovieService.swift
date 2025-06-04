//
//  MovieService.swift
//  MovieApp DependcyInjection
//
//  Created by Kerolos on 04/06/2025.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchMovies(completion: @escaping ([Movie]) -> Void)
}

class MovieService : MovieServiceProtocol {
    func fetchMovies(completion: @escaping ([Movie]) -> Void) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let movies = [
                    Movie(id: 1, title: "The Matrix", year: 1999),
                    Movie(id: 2, title: "Inception", year: 2010),
                    Movie(id: 3, title: "Interstellar", year: 2014)
                ]
                completion(movies)
            }
        }
}

