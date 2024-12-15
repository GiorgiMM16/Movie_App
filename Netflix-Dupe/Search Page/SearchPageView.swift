import SwiftUI
import SimpleNetworking

struct SearchPageView: View {
    
    @ObservedObject var viewModel: EpisodesPageViewModel
    @State private var searchTerm = ""
    @State private var searchOption = SearchOption.name
    
    enum SearchOption: String, CaseIterable {
        case name = "Name"
        case releaseDate = "Release Date"
    }
    
    var filteredEpisodes: [Episode] {
        return viewModel.episodes.filter { episode in
            switch searchOption {
            case .name:
                return episode.title?.localizedCaseInsensitiveContains(searchTerm) ?? false
            case .releaseDate:
                return episode.releaseDate.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    
                    SearchBar(text: $searchTerm)
                        .padding(.vertical)
                    
                    Picker("Search Option", selection: $searchOption) {
                        ForEach(SearchOption.allCases, id: \.self) { option in
                            Text(option.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    .padding(.horizontal)
                    
                }
                
                ScrollView {
                    VStack {
                        ForEach(filteredEpisodes) { episode in
                            HStack(alignment: .center) {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(episode.posterPath)")) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 145)
                                        .clipped()
                                        .cornerRadius(10)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 100, height: 150)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(episode.title!)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                    
                                    Text(episode.releaseDate)
                                        .font(.headline)
                                        .foregroundColor(.black)
                                }
                            }
                            .padding()
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                    }
                }
            }
            .navigationTitle("Search")
            .onAppear {
                viewModel.fetchEpisodes()
            }
        }
    }
}


struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        TextField("Search Episodes", text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageView(viewModel: EpisodesPageViewModel(webService: WebService()))
    }
}
