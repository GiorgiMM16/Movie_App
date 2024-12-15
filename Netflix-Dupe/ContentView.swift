//
//  ContentView.swift
//  Netflix-Dupe
//
//  Created by Giorgi Michitashvili on 6/5/24.
//

import SwiftUI
import SimpleNetworking
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            EpisodesPageView(viewModel: EpisodesPageViewModel(webService: WebService()))
                .tabItem {
                    Text("Home")
                    Image(systemName: "house")
                }
            SearchPageView(viewModel: EpisodesPageViewModel(webService: WebService()))
                .tabItem {
                    Text("Search")
                    Image(systemName: "magnifyingglass")
                }
            FavoritesPageView(viewModel: FavoritesPageViewModel())
                .tabItem {
                    Text("Favorites")
                    Image(systemName: "bookmark")
                }
            
        }
        .modelContainer(for: EpisodeDetails.self)
    }
}

#Preview {
    ContentView()
}
