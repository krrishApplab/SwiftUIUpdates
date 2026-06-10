//
//  SearchViewModel.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import Foundation
import Observation

@MainActor
@Observable
final class SearchViewModel {
    private let allItems: [SearchItem]
    var searchText: String = ""

    init(items: [SearchItem] = SearchItem.sampleData) {
        self.allItems = items
    }

    var filteredItems: [SearchItem] {
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else { return allItems }
        return allItems.filter { item in
            item.title.localizedCaseInsensitiveContains(query) ||
            item.subtitle.localizedCaseInsensitiveContains(query)
        }
    }

    var hasResults: Bool {
        !filteredItems.isEmpty
    }

    var isSearching: Bool {
        !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var emptyStateMessage: String {
        isSearching
            ? "No results match \"\(searchText)\"."
            : "Start typing to search."
    }
}
