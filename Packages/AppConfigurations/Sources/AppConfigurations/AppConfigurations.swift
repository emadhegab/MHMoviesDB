public struct AppConfigurations {

    public static let shared = AppConfigurations()
    private init() {
    }

    public var apiKey = "7ef042d8f0c43b84664911ff8ffad06c"

    public var baseURL = "https://api.themoviedb.org"

    public var apiVersion = "/3"
}
