import Foundation
import SwiftUI
import Combine

extension PopularMoviesView {
    class ViewModel: ObservableObject {

        @Published var movies: PopularMovie? = nil
        var cancellable: AnyCancellable? = nil

        var popularMoviesService = ServicesContainer.shared.getPopularMoviesService()
        func getMovies() {
            cancellable =  popularMoviesService.getPopularMovies()
                .sink { completion in
                } receiveValue: { movies in
                    self.movies = movies
                }
        }
    }
}
