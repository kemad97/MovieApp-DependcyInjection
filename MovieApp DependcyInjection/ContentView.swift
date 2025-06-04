//
//  ContentView.swift
//  MovieApp DependcyInjection
//
//  Created by Kerolos on 04/06/2025.
//

import SwiftUI
import SwiftData

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: MovieListViewModel
    
    init(viewModel: MovieListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.movies, id: \.id) { movie in
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)
                    Text("Year: \(movie.year)")
                        .font(.subheadline)
                }
            }
            .navigationTitle("Movies")
            .onAppear {
                viewModel.fetchMovies()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MovieListViewModel(fetchMoviesUseCase: FetchMoviesUseCase(movieService: MovieService())))
    }
}

