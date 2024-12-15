//
//  EpisodesPageViewModel.swift
//  Netflix-Dupe
//
//  Created by Giorgi Michitashvili on 6/6/24.
//

import Foundation
import SimpleNetworking


class EpisodesPageViewModel: ObservableObject {
    
    @Published var episodes: [Episode] = []
    
    
    let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func fetchEpisodes() {
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=3e197931cc22121f5cb0206ad4f836eb"
        
        webService.fetchData(from: urlString, resultType: EpisodeResults.self) { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.episodes = response.results!
                }
            case .failure(_):
                DispatchQueue.main.async {
                }
            }
        }
    }
}
