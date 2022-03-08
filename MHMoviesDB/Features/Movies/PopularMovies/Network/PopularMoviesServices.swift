import Networking
import Combine
import Foundation

protocol PopularMoviesSerivces {
    func getPopularMovies() -> AnyPublisher<PopularMovie, Error>
}

class PopularMoviesSerivcesImpl: PopularMoviesSerivces {

    var cancellable: AnyCancellable? = nil

    func getPopularMovies() -> AnyPublisher<PopularMovie, Error> {
        let request = PopularMoviesRequest.getPopularMovies
        return API().fetch(type: PopularMovie.self, for: request)
    }
}
