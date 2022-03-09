//
//  DetailsView.swift
//  MHMoviesDB
//
//  Created by Mohamed Hegab on 2022-03-07.
//

import SwiftUI

struct MovieDetailsView: View {
    let details: MovieDetails
    let namespace: Namespace.ID
    let image: Image

    var body: some View {
        VStack {
                image
                .resizable()
                .cornerRadius(20.0)
                .matchedGeometryEffect(id: "poster\(details.id)", in: namespace)
            
            Spacer()
            Text(details.title)
                .font(Font.title)
                .fontWeight(.heavy)


        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
//        let movie = MovieDetails(adult: <#T##Bool#>, backdropPath: <#T##String#>, budget: <#T##Int#>, genres: <#T##[Genre]#>, homepage: <#T##String#>, id: <#T##Int#>, imdbID: <#T##String#>, originalLanguage: <#T##String#>, originalTitle: <#T##String#>, overview: <#T##String#>, popularity: <#T##Double#>, posterPath: <#T##String?#>, productionCompanies: <#T##[ProductionCompany]#>, productionCountries: <#T##[ProductionCountry]#>, releaseDate: <#T##String#>, revenue: <#T##Int#>, runtime: <#T##Int#>, spokenLanguages: <#T##[SpokenLanguage]#>, status: <#T##String#>, tagline: <#T##String#>, title: <#T##String#>, video: <#T##Bool#>, voteAverage: <#T##Double#>, voteCount: <#T##Int#>)
//        MovieDetailsView(details: movie)
        Text("1")
    }
}
