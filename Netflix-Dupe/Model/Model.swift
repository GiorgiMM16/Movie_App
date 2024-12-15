import Foundation

struct Episode: Decodable, Identifiable {
    let id: Int
    let title: String?
    let overview: String?
    let posterPath: String
    let popularity: Double
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
            case id, title, overview, popularity
            case posterPath = "poster_path"
            case releaseDate = "release_date"
        }
}

struct EpisodeResults: Decodable {
    let results: [Episode]?
}
 
struct Details: Codable, Identifiable {
    let adult: Bool
    let backdropPath: String?
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdbID: String
    let originCountry: [String]
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let revenue: Int
    let runtime: Int
    let status, tagline, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
 
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget
        case genres
        case homepage
        case id
        case imdbID = "imdb_id"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case status
        case tagline
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
 
struct Genre: Codable {
    let id: Int
    let name: String
}
 
struct Genres: Codable {
    let genres: [Genre]
}
