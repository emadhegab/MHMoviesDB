//
//  PopularMovies.swift
//  MHMoviesDB
//
//  Created by Mohamed Hegab on 2022-03-07.
//

import SwiftUI

struct PopularMoviesView: View {
    @Namespace var namespace
    @ObservedObject var viewModel = ViewModel()
    @State var showDetails: Bool = false
    @State var selectedMovie: Movie?

    var body: some View {
        ZStack {
            VStack {

                HStack {
                    Text("Popular")
                        .bold()
                        .padding()
                    Spacer()
                    Image(systemName: "arrow.forward")
                        .font(Font.title.weight(.medium))
                        .padding()
                        .matchedGeometryEffect(id: "poster", in: namespace)

                }
                ScrollView(.horizontal) {
                    if let movies = viewModel.popularMovies {
                        HStack {
                            ForEach(movies.results, id: \.id) { movie in
                                MovieCell(movie: movie)
                                    .frame(width: 200, height: 300, alignment: .center)
                                    .onTapGesture {
                                        selectedMovie = movie
                                        showDetails.toggle()
                                    }
                            }
                        }
                    }
                }
                .onAppear {
                    viewModel.getMovies()
                }
            }
            if showDetails, let movie = selectedMovie {
                MovieDetailsView(details: movie.details, namespace: _namespace)
                    .onTapGesture {
                        showDetails.toggle()
                    }
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
