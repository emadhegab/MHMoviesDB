import Foundation
import Combine

public struct API<T: Decodable> {
    public init() {
    }

    public func fetch(type: T.Type, for request: Request) -> AnyPublisher<T, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request.urlRequest())
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .print()
            .eraseToAnyPublisher()
    }
}
