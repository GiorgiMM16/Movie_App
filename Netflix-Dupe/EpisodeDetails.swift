//
//  EpisodeDetails.swift
//  Netflix-Dupe
//
//  Created by Giorgi Michitashvili on 6/11/24.
//

import Foundation
import SwiftData


@Model
class EpisodeDetails: ObservableObject {
    var backdropPath: String
    var genres: [Genre]
    var id: Int
    var overview: String
    var popularity: Double
    var posterPath: String
    var releaseDate: String
    var runtime: Int
    
    init(backdropPath: String, genres: [Genre], id: Int, overview: String, popularity: Double, posterPath: String, releaseDate: String, runtime: Int) {
        self.backdropPath = backdropPath
        self.genres = genres
        self.id = id
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.runtime = runtime
    }
}
