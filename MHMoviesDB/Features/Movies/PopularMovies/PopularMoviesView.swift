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
            Text("\(viewModel.movies?.results.count ?? 0)")
            Text("Hello, World!")
                .onTapGesture {
                    viewModel.getMovies()
                }
        }
    }
}

struct PopularMovies_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesView()
    }
}
