//
//  ContentView.swift
//  MovieApp DependcyInjection
//
//  Created by Kerolos on 04/06/2025.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MovieListViewModel
    
    init(viewModel: MovieListViewModel) {
            self.viewModel = viewModel
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
        //ContentView(viewModel: MovieListViewModel.)
    }
}
