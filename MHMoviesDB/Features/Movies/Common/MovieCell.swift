//
//  MovieCell.swift
//  MHMoviesDB
//
//  Created by Mohamed Hegab on 2022-03-07.
//

import SwiftUI

struct MovieCell: View {
    let movie: Movie
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .cornerRadius(20.0)
            .padding(6)
        }

    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: Movie(adult: true, backdropPath: "/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg", genreIDS: [1,2], id: 1, originalTitle: "Spider-man No Way Home", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.", popularity: 5342.778, posterPath: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg", releaseDate: "", title: "Spider-Man: No Way Home", video: false, voteAverage: 8.3, voteCount: 8670))
    }
}
