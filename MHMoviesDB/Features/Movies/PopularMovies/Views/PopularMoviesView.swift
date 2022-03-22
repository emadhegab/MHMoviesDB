//
//  PopularMovies.swift
//  MHMoviesDB
//
//  Created by Mohamed Hegab on 2022-03-07.
//

import SwiftUI
import DesignSystem

struct PopularMoviesView: View {

    @Namespace var namespace
    @ObservedObject var viewModel = ViewModel()
    @State var showDetails: Bool = false
    @State var selectedMovie: Movie?
    @State var ownTop = CGFloat.zero
    var geo: GeometryProxy?

    var body: some View {
        ZStack {
            if !showDetails {
                VStack {
                    HStack {
                        Text("Popular")
                            .font(Font.itemCaption)
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
                                            self.selectedMovie = movie

                                            withAnimation(Animation.interpolatingSpring(stiffness: 270, damping: 15)) {
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


            }

            if showDetails, let movie = selectedMovie, let details = movie.details {

                GeometryReader { geo in Color.clear.onAppear {
                    ownTop = geo.frame(in: .global).minY
                    print(ownTop)
                }}
                .overlay (
                    MovieDetailsView(details: details, namespace: namespace, image: viewModel.imageDictionary["\(movie.id)"]!)

                        .frame(width: geo!.size.width, height: geo!.size.height)
                        .background(.gray)
                        .position(x: geo!.frame(in: .global).midX, y: geo!.frame(in: .global).midY - ownTop)

                        .onTapGesture {
                            withAnimation(Animation.interpolatingSpring(stiffness: 270, damping: 15)) {
                                showDetails.toggle()
                            }
                        }
                )


                
                    .onTapGesture {
                        withAnimation(Animation.interpolatingSpring(stiffness: 270, damping: 15)) {
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

        return PopularMoviesView(viewModel: viewModel, geo: nil)
    }
}
