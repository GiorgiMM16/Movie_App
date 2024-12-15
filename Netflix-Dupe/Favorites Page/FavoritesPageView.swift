//
//  FavoritesPageView.swift
//  Netflix-Dupe
//
//  Created by Giorgi Michitashvili on 6/9/24.
//

import SwiftUI

struct FavoritesPageView: View {
    
    @ObservedObject var viewModel: FavoritesPageViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    FavoritesPageView(viewModel: FavoritesPageViewModel())
}
