//
//  FavoritesViewModel.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import Foundation
import Observation

@MainActor
@Observable
final class FavoritesViewModel {
    private let allItems: [FavoriteItem]
    var searchText: String = ""

    init(items: [FavoriteItem] = FavoriteItem.sampleData) {
        self.allItems = items
    }

    var filteredItems: [FavoriteItem] {
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
            ? "No favorites match \"\(searchText)\"."
            : "You have no favorites yet."
    }
}
