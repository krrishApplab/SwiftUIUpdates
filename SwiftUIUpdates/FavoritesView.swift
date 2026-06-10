//
//  FavoritesView.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import SwiftUI

struct FavoritesView: View {
    @State private var viewModel = FavoritesViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.hasResults {
                    favoritesList
                } else {
                    emptyState
                }
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.large)
            .searchable(
                text: $viewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search favorites"
            )
            .accessibilityIdentifier("favorites.searchField")
        }
    }

    // MARK: - Subviews
    private var favoritesList: some View {
        List(viewModel.filteredItems) { item in
            FavoriteRowView(item: item)
                .accessibilityIdentifier(item.accessibilityIdentifier)
        }
        .listStyle(.insetGrouped)
        .accessibilityIdentifier("favorites.list")
    }

    private var emptyState: some View {
        ContentUnavailableView {
            Label("No Favorites Found", systemImage: "star.slash")
        } description: {
            Text(viewModel.emptyStateMessage)
        }
        .accessibilityIdentifier("favorites.emptyState")
    }
}

#Preview {
    FavoritesView()
}
