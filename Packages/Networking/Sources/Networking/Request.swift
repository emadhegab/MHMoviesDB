
import Foundation
import AppConfigurations

public enum HTTPMethod: String {
    case get            = "GET"
    case post           = "POST"
    case put            = "PUT"
    case delete         = "DELETE"
    case patch          = "PATCH"
}

/// The definition of  Request struct that we will extend to match specific API requirements:
public protocol Request {
    /// the Path of the endpoint that needed for this reuqest (eg. "/users/1")
    var path: String { get }
    /// all parameters that needed inside the URLRequest body, in the form of [String: Any]
    var bodyParameters: [String: Any]? { get }
    /// all parameters that needed on the endpoint , (eg."/users/1**?langage=en-UK**)
    /// And it should be in the form of [String: Any]
    var urlParameters: [String: Any]? { get }
    /// method will hold the value of the Request Method such as (POST, GET, PUT, PATCH,  etc)
    var method: HTTPMethod { get }

    /// toggle to true if the content-type is in the form of **application/x-www-form-urlencoded**
    /// otherwise default to false where content-type is **application/json**
    var formRequest: Bool { get }
}

/// extension of Request in which we construct the URL for the NA-KD API.
extension Request {
 

    public var formRequest: Bool {
        return false
    }

    public var bodyParameters: [String: Any]? {
        return nil
    }

    public var urlParameters: [String: Any]? {
        return nil
    }

    var url: URL {
        let baseURL =  AppConfigurations.shared.baseURL
        var components = URLComponents(string: baseURL)
        components?.path = AppConfigurations.shared.apiVersion + path

        let defaultParameters = [URLQueryItem(name: "language", value: "en-US"),
                                 URLQueryItem(name: "api_key", value: AppConfigurations.shared.apiKey)]
        if let queryParams = urlParameters {
            var queryItems = queryParams.map({ (element) -> URLQueryItem in
                return URLQueryItem(name: element.key, value: element.value as? String)
            })
            queryItems.append(contentsOf: defaultParameters)
            components?.queryItems = queryItems
        } else {
            components?.queryItems =  defaultParameters
        }

        guard let url = components?.url else {
            preconditionFailure("Invalid URL components: \(String(describing: components))")
        }

        return url
    }

    func headers() -> [String: String] {
        return [
            "Content-Type": getContentType(),
            "Accept-Type": "application/json",
        ]
    }

    func urlRequest() -> URLRequest {
        var request = URLRequest(url: self.url)
        request.allHTTPHeaderFields = headers()
        request.httpMethod = self.method.rawValue
        if let params = bodyParameters {
            let bodyData = serializeBodyData(params)
            request.httpBody = bodyData
        }
        return request
    }

    private func serializeBodyData(_ params: [String: Any]) -> Data? {
        let formData = mapParametersToForm(params: params)
        if formRequest {
            return  formData.data(using: .utf8)
        } else {
            return  try? JSONSerialization.data(withJSONObject: params, options: .init(rawValue: 0))
        }
    }


    private func mapParametersToForm(params: [String : Any]) -> String
    {
        var formData = [String]()
        for(key, value) in params
        {
            formData.append(key + "=\(value)")
        }
        return formData.map { String($0) }.joined(separator: "&")
    }

    fileprivate func getContentType() -> String {
        return formRequest ? "application/x-www-form-urlencoded" : "application/json"
    }
}


extension Encodable {
    /// dictionary purpose is to convert an Encodable Model into [String: Any] data, to be able to send it in the HTTP request body.
    public var dictionary: [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] } ?? [:]
    }
}
