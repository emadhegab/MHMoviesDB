import Networking
enum MovieDetailsRequest: Request {
    case getMovieDetails(id: String)

    var path: String {
        switch self {
        case .getMovieDetails(let id):
            return "/movie/\(id)"
        }
    }

    var method: HTTPMethod {
        .get
    }
}
