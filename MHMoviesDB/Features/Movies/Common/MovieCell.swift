//
//  MovieCell.swift
//  MHMoviesDB
//
//  Created by Mohamed Hegab on 2022-03-07.
//

import SwiftUI
import DesignSystem

struct MovieCell: View {
    let movie: Movie
    let namespace: Namespace.ID
    let image: Image
    var body: some View {
        VStack {
            image
                .resizable()
                .cornerRadius(20.0)
                .matchedGeometryEffect(id: "poster\(movie.id)", in: namespace)
        }

    }
}

