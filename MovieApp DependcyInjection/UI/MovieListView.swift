//
//  MovieListView.swift
//  MovieApp DependcyInjection
//
//  Created by Kerolos on 04/06/2025.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject private var viewModel : MovieListViewModel
    
    init(viewModel: MovieListViewModel) {
        self.viewModel =  viewModel
    }
    
    var body: some View {
        NavigationView(){
            List(viewModel.movies , id: \.id){movie in
                VStack{
                    VStack(alignment: .leading) {
                        Text(movie.title)
                        Text("Year: \(movie.year)")
                    }
                }
                .navigationTitle("Movies")
                .onAppear{
                    viewModel.fetchMovies()
                }
                
                
                
            }
        }
        
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: MovieListViewModel(fetchMoviesUseCase: FetchMoviesUseCase(movieService: MovieService())))
    }
}
