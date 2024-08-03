import UIKit

let apiKey = "c0983ffdb6c7ebb309cd7588b49239d1"
let language = "en-US"
let page = "1"

var components = URLComponents(string: "https://api.themoviedb.org/3/movie/popular")

components?.queryItems = [
    URLQueryItem(name: "api_key", value: apiKey),
    URLQueryItem(name: "language", value: language),
    URLQueryItem(name: "page", value: page)
]

let request = URLRequest(url: components?.url ?? URL(fileURLWithPath: ""))

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    guard let response = response as? HTTPURLResponse else { return }
    
    if let data = data {
        if response.statusCode == 200 {
            decodeJSON(from: data)
        } else {
            debugPrint("ERROR : \(data), HTTP STATUS : \(response.statusCode)")
        }
    }
}

task.resume()

func decodeJSON(from data: Data) {
    let decoder = JSONDecoder()
    if let movies = try? decoder.decode(MovieResponse.self, from: data) as MovieResponse {
        debugPrint("PAGE : \(movies.page)")
        debugPrint("TOTAL RESULT : \(movies.totalResults)")
        debugPrint("TOTAL PAGES : \(movies.totalPages)")
        
        movies.movies.forEach { movie in
            debugPrint("TITLE : \(movie.title)")
            debugPrint("POSTER : \(movie.posterPath)")
            debugPrint("RELEASE DATE : \(movie.releaseDate)")
        }
    } else {
        debugPrint("ERROR : Can't Decode JSON")
    }
}

struct MovieResponse : Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let movies: [MovieResultResponse]
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case movies = "results"
    }
}

struct MovieResultResponse : Codable {
    let popularity: Double
    let posterPath: String
    let title: String
    let genres: [Int]
    let voteAverage: Double
    let overview: String
    let releaseDate: Date
    
    enum CodingKeys: String, CodingKey {
        case popularity
        case posterPath = "poster_path"
        case title
        case genres = "genre_ids"
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // MARK: Menentukan alamat gambar.
        let path = try container.decode(String.self, forKey: .posterPath)
        posterPath = "https://image.tmdb.org/t/p/w300\(path)"
        
        // MARK: Menentukan tanggal rilis.
        let dateString = try container.decode(String.self, forKey: .releaseDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        releaseDate = dateFormatter.date(from: dateString) ?? Date()
        
        // MARK: Untuk properti lainnya, cukup disesuaikan saja.
        popularity = try container.decode(Double.self, forKey: .popularity)
        title = try container.decode(String.self, forKey: .title)
        genres = try container.decode([Int].self, forKey: .genres)
        voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        overview = try container.decode(String.self, forKey: .overview)
    }
}
