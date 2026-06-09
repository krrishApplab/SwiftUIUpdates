//
//  SearchView.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import SwiftUI

struct SearchView: View {

    // MARK: - State
    @State private var viewModel = SearchViewModel()

    // MARK: - Body
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.hasResults {
                    resultsList
                } else {
                    emptyState
                }
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.large)
            .searchable(
                text: $viewModel.searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search items"
            )
        }
    }

    // MARK: - Results
    private var resultsList: some View {
        List(viewModel.filteredItems) { item in
            SearchRowView(item: item)
                .accessibilityIdentifier("search.row.\(item.title)")
        }
        .listStyle(.plain)
        .accessibilityIdentifier("search.list")
    }

    // MARK: - Empty State
    private var emptyState: some View {
        ContentUnavailableView.search(text: viewModel.searchText)
            .accessibilityIdentifier("search.emptyState")
    }
}

#Preview {
    SearchView()
}
