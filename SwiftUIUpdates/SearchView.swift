//
//  SearchView.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import SwiftUI

struct SearchView: View {
    @State private var viewModel = SearchViewModel()

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.hasResults {
                    searchList
                } else {
                    emptyState
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.large)
            .searchable(
                text: $viewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search topics"
            )
            .accessibilityIdentifier("search.searchField")
        }
    }

    // MARK: - Subviews
    private var searchList: some View {
        List(viewModel.filteredItems) { item in
            SearchRowView(item: item)
                .accessibilityIdentifier(item.accessibilityIdentifier)
        }
        .listStyle(.insetGrouped)
        .accessibilityIdentifier("search.list")
    }

    private var emptyState: some View {
        ContentUnavailableView {
            Label("No Results Found", systemImage: "magnifyingglass")
        } description: {
            Text(viewModel.emptyStateMessage)
        }
        .accessibilityIdentifier("search.emptyState")
    }
}

#Preview {
    SearchView()
}
