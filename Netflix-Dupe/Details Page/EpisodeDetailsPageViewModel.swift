//
//  EpisodeDetailsPageViewModel.swift
//  Netflix-Dupe
//
//  Created by Giorgi Michitashvili on 6/9/24.
//

import Foundation
import SimpleNetworking

class EpisodeDetailsPageViewModel: ObservableObject {
    
    @Published var episode: Episode
    @Published var details: Details?
        
    let webService: WebService
    
    init(webService: WebService, episode: Episode) {
        self.webService = webService
        self.episode = episode
    }
        
    
    func fetchEpisodeDetails() {
        let urlString = "https://api.themoviedb.org/3/movie/\(episode.id)?api_key=936d7807b77bbb4238f8847775a026ad"
        
        webService.fetchData(from: urlString, resultType: Details.self) { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.details = response
                }
            case .failure(_):
                DispatchQueue.main.async {
                }
            }
        }
    }

    
}
