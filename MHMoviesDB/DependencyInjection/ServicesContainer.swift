class ServicesContainer {
    static let shared = ServicesContainer()
    private init() {}

    func getPopularMoviesService() -> PopularMoviesSerivces {
        return PopularMoviesSerivcesImpl()
    }

    func getMovieDetailsService() -> MovieDetailsSerivces {
        return DetailsSerivcesImpl()
    }
}
