//
//  EpisodeDetailsPage.swift
//  Netflix-Dupe
//
//  Created by Giorgi Michitashvili on 6/9/24.
//

import SwiftUI
import SimpleNetworking
import SwiftData

struct EpisodeDetailsPageView: View {
    
    
    //  გულის ღილაკისთვის საჭირო ცვლადი
    @State private var isTapped = false
    
    // ფავორიტი ფილმების ერეი
    var favorites: [EpisodeDetails] = []
    
    @ObservedObject var viewModel: EpisodeDetailsPageViewModel
    
    var body: some View {
        VStack{
            
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(viewModel.details?.backdropPath ?? "5")")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 375, height: 210)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            } placeholder: {
                ProgressView()
                    .frame(width: 375, height: 210)
            }
            HStack (alignment: .top, spacing: 12) {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(viewModel.episode.posterPath)")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 95, height: 120)
                        .cornerRadius(10)
                        .padding(.top, -60)
                        .shadow(radius: 5)
                } placeholder: {
                    ProgressView()
                        .frame(width: 95, height: 120)
                }
                Text(viewModel.episode.title ?? "No Title")
                    .font(.headline)
                    .frame(width: 210, height: 48, alignment: .topLeading)
                    
            }
            
            HStack {
                Text(viewModel.details?.releaseDate ?? "No Release Date")
                    .font(.caption)
                    .padding()
                Text("\(viewModel.details?.runtime ?? 5) Minutes")
                    .font(.caption)
                    .padding()
                Text(viewModel.details?.genres[1].name ?? "No Genre")
                    .font(.caption)
                    .padding()
            }
            
            HStack (spacing: 210){
                
                Text("About movie")
                    .font(.subheadline)
                    .bold()
                
                Button {
                    isTapped.toggle()
                    let favorite = EpisodeDetails(backdropPath: "\(viewModel.details?.backdropPath ?? "5")", genres: viewModel.details?.genres ?? [], id: viewModel.details?.id ?? 0, overview: viewModel.details?.overview ?? "No OverView", popularity: viewModel.details?.popularity ?? 5.0, posterPath: "\(viewModel.episode.posterPath)", releaseDate: "\(viewModel.details?.releaseDate ?? "No Release Date")", runtime: viewModel.details?.runtime ?? 5)
                } label: {
                    Image(systemName: isTapped ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                }
            } .padding(.top, 30)
            
            Text(viewModel.details?.overview ?? "No OverView")
                .font(.caption)
                .padding()
            
            Spacer()
        }
        .navigationTitle(viewModel.episode.title ?? "Details")
        .padding()
        .onAppear {
            viewModel.fetchEpisodeDetails()
        }
    }
}


//#Preview {
//    EpisodeDetailsPageView(viewModel: EpisodeDetailsPageViewModel(webService: WebService(), episode: viewModel.episode))
//}
