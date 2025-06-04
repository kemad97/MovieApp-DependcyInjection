//
//  FetchMoviesUseCaseProtocol.swift
//  MovieApp DependcyInjection
//
//  Created by Kerolos on 04/06/2025.
//

import Foundation

protocol FetchMoviesUseCaseProtocol {
    func execute(completion: @escaping ([Movie]) -> Void)
}
