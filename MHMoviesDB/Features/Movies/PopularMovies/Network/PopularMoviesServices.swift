    import Networking
import Combine
import Foundation

protocol PopularMoviesSerivces {
    var movies: PopularMovie? { get }
    func getPopularMovies() -> AnyPublisher<PopularMovie, Error>
}

class PopularMoviesSerivcesImpl: PopularMoviesSerivces, ObservableObject {

    var cancellable: AnyCancellable? = nil
    @Published var movies: PopularMovie? = nil

    func getPopularMovies() -> AnyPublisher<PopularMovie, Error> {
        let request = PopularMoviesRequest.getPopularMovies
        return API().fetch(type: PopularMovie.self, for: request)
    }
}
