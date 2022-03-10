//
//  DetailsView.swift
//  MHMoviesDB
//
//  Created by Mohamed Hegab on 2022-03-07.
//

import SwiftUI
import DesignSystem

struct MovieDetailsView: View {
    let details: MovieDetails
    let namespace: Namespace.ID
    let image: Image

    var body: some View {
        VStack {

            ZStack(alignment: .bottom){
                GeometryReader { geo in
                    image
                        .resizable()
                        .frame(width: geo.size.width, height: geo.size.height * 0.5,
                               alignment: .center)
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(
                            id: "poster\(details.id)", in: namespace)
                        .ignoresSafeArea()
                }

                GeometryReader { geo in
                    ZStack(alignment: .bottom) {
                        Color.gray
                            .frame(height: geo.size.height * 0.7, alignment: .bottom)
                        VStack {
                            Spacer()
                            Text(details.title)
                                .font(Font.movieTitle)
                                .multilineTextAlignment(.center)

                            Spacer()
                        }
                    }

                    .ignoresSafeArea()
                }
            }
//            Spacer()


        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var image = Image("default", bundle: .main)
    static var previews: some View {
        let movie = MovieDetails(adult: true, backdropPath: "/", budget: 1000, genres: [Genre(id: 1, name: "action")], homepage: "", id: 1, imdbID: "1", originalLanguage: "English", originalTitle: "Spider-man", overview: "", popularity: 4, posterPath: "", productionCompanies: [], productionCountries: [], releaseDate: "", revenue: 4141, runtime: 114, spokenLanguages: [], status: "", tagline: "", title: "Spider-Man", video: false, voteAverage: 22, voteCount: 22)
        MovieDetailsView(details: movie, namespace: namespace, image: image)

    }
}
