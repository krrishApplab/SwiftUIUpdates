//
//  FavoritesView.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import SwiftUI

struct FavoritesView: View {

    // MARK: - State
    @State private var viewModel = FavoritesViewModel()

    // MARK: - Body
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.hasResults {
                    favoritesList
                } else {
                    emptyState
                }
            }
            .navigationTitle("Favourites")
            .navigationBarTitleDisplayMode(.large)
            .searchable(
                text: $viewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search favourites"
            )
        }
    }

    // MARK: - List
    private var favoritesList: some View {
        List(viewModel.filteredItems) { item in
            FavoriteRowView(item: item)
        }
        .listStyle(.insetGrouped)
        .accessibilityIdentifier("favorites.list")
    }

    // MARK: - Empty State
    private var emptyState: some View {
        ContentUnavailableView.search(text: viewModel.searchText)
            .accessibilityIdentifier("favorites.emptyState")
    }
}

#Preview {
    FavoritesView()
}
