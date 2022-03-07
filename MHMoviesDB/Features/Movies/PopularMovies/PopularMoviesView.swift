//
//  PopularMovies.swift
//  MHMoviesDB
//
//  Created by Mohamed Hegab on 2022-03-07.
//

import SwiftUI

struct PopularMoviesView: View {

    @ObservedObject var viewModel = ViewModel()
 
    var body: some View {
        VStack {

            HStack {
                Text("Popular")
                    .bold()
                    .padding()
                Spacer()
                Image(systemName: "arrow.forward")
                    .font(Font.title.weight(.medium))
                    .padding()

            }
            ScrollView(.horizontal) {
                if let movies = viewModel.movies {
                    HStack {
                        ForEach(movies.results, id: \.id) { movie in
                            MovieCell(movie: movie)
                                .frame(width: 200, height: 300, alignment: .center)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.getMovies()
            }
        }
    }
}

struct PopularMovies_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = PopularMoviesView.ViewModel()

        return PopularMoviesView(viewModel: viewModel)
    }
}
