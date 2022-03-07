import Networking

enum PopularMoviesRequest: Request {
    case getPopularMovies

    var path: String {
        switch self {
        case .getPopularMovies:
            return "/movie/popular"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getPopularMovies:
            return .get
        }
    }
}
