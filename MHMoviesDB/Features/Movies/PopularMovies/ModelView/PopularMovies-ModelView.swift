import Foundation
import SwiftUI
import Combine

extension PopularMoviesView {

    class ViewModel: ObservableObject {

        @Published var popularMovies: PopularMovie? = nil
        var popularMoviesCancellable: AnyCancellable? = nil
        var movieDetailsCancellables: Set<AnyCancellable> = []
        var imageDictionary: [String: Image] = [:]
        var popularMoviesService = ServicesContainer.shared.getPopularMoviesService()
        let movieDetailsService = ServicesContainer.shared.getMovieDetailsService()
        func getMovies() {
            popularMoviesCancellable =  popularMoviesService.getPopularMovies()
                .sink { completion in

                } receiveValue: { movies in
                    self.popularMovies = movies
                    movies.results.forEach {
                        self.createImageDictionary(movie: $0)
                    }
                   let _ = self.popularMovies?.results.forEach { popularMovie in
                        self.getMovieDetails(id: "\(popularMovie.id)")
                           .sink(receiveCompletion: { _ in

                           }, receiveValue: { details in
                               if let row = self.popularMovies?.results.firstIndex(where: { $0.id == details.id }) {
                                   self.popularMovies?.results[row].details = details
                               }

                           }).store(in: &self.movieDetailsCancellables)
                    }
                }
        }

        func getMovieDetails(id: String) -> AnyPublisher<MovieDetails, Error> {
            movieDetailsService.getMovieDetails(id: id)
        }

        func createImageDictionary(movie: Movie)  {
            if let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)"),
               let data =  try? Data(contentsOf: url),
               let uiimage = UIImage(data: data) {
                   imageDictionary["\(movie.id)"] = Image(uiImage: uiimage)
                }
        }
    }
}
