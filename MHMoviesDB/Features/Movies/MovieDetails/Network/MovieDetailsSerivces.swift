import Networking
import Combine
import Foundation

protocol MovieDetailsSerivces {
    func getMovieDetails(id: String) -> AnyPublisher<MovieDetails, Error>
}

class DetailsSerivcesImpl: MovieDetailsSerivces {

    var cancellable: AnyCancellable? = nil

    func getMovieDetails(id: String) -> AnyPublisher<MovieDetails, Error> {
        let request = MovieDetailsRequest.getMovieDetails(id: id)
        return API().fetch(type: MovieDetails.self, for: request)
    }
}
