//
//  MovieListView.swift
//  MovieApp DependcyInjection
//
//  Created by Kerolos on 04/06/2025.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel : MovieListViewModel
    
    init(viewModel: MovieListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView(){
            List(viewModel.movies , id: \.id){movie in
                VStack{
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                        Text("Year: \(movie.year)")
                            .font(.subheadline)
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
/*
#Preview {
    MovieListView(viewModel: MovieListViewModel(fetchMoviesUseCase: FetchMoviesUseCase(movieService: MovieService() ) ) )
    
}
*/

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(viewModel: MovieListViewModel(fetchMoviesUseCase: FetchMoviesUseCase(movieService: MovieService())))
    }
}
