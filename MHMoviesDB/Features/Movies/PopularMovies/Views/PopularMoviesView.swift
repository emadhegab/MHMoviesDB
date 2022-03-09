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

                }
                ScrollView(.horizontal) {
                    if let movies = viewModel.popularMovies {
                        HStack {
                            ForEach(movies.results, id: \.id) { movie in
                                MovieCell(movie: movie, namespace: namespace, image: viewModel.imageDictionary["\(movie.id)"]!)
                                    .padding(6)
                                    .frame(width: 200, height: 300)
                                    .onTapGesture {
                                        selectedMovie = movie
                                        withAnimation(.easeIn) {
                                            showDetails.toggle()
                                        }
                                    }
                            }
                        }
                    }
                }
                .onAppear {
                    viewModel.getMovies()
                }
            }
            if showDetails, let movie = selectedMovie, let details = movie.details {
                MovieDetailsView(details: details, namespace: namespace, image: viewModel.imageDictionary["\(movie.id)"]!)
                    .onTapGesture {
                        withAnimation(.easeOut) {
                            showDetails.toggle()
                        }
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
