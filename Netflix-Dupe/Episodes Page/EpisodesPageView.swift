import SwiftUI
import SimpleNetworking

struct EpisodesPageView: View {
    
    @ObservedObject var viewModel: EpisodesPageViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 22) {
                    ForEach(viewModel.episodes) { episode in
                        NavigationLink(destination: EpisodeDetailsPageView(viewModel: EpisodeDetailsPageViewModel(webService: WebService(), episode: episode))) {
                            VStack(spacing: 10.08) {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(episode.posterPath)")) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 145)
                                        .clipped()
                                        .cornerRadius(10)
                                        .shadow(radius: 5)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 100, height: 150)
                                }
                                Text(episode.title ?? "No Title")
                                    .font(.caption2)
                                    .foregroundColor(.primary)
                                    .bold()
                                    .frame(width: 100, height: 30)
                            }
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Movies")
            .onAppear {
                viewModel.fetchEpisodes()
            }
        }
    }
}

#Preview {
    EpisodesPageView(viewModel: EpisodesPageViewModel(webService: WebService()))
}
