//
//  SearchViewModel.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 09/06/26.
//

import Observation
import SwiftUI

struct SearchItem: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let subtitle: String
    let systemImage: String
}

@Observable
final class SearchViewModel {

    // MARK: - State
    var searchText: String = ""

    // MARK: - Data
    private let items: [SearchItem]

    // MARK: - Init
    init(items: [SearchItem] = SearchViewModel.sampleItems) {
        self.items = items
    }

    // MARK: - Filtering
    var filteredItems: [SearchItem] {
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !query.isEmpty else { return items }

        return items.filter { item in
            item.title.localizedCaseInsensitiveContains(query)
                || item.subtitle.localizedCaseInsensitiveContains(query)
        }
    }

    var hasResults: Bool {
        !filteredItems.isEmpty
    }

    var isSearching: Bool {
        !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    // MARK: - Sample Data
    static let sampleItems: [SearchItem] = [
        SearchItem(title: "Avocado", subtitle: "Fruit", systemImage: "leaf.fill"),
        SearchItem(title: "Banana", subtitle: "Fruit", systemImage: "leaf.fill"),
        SearchItem(title: "Blueberry", subtitle: "Fruit", systemImage: "leaf.fill"),
        SearchItem(title: "Cherry", subtitle: "Fruit", systemImage: "leaf.fill"),
        SearchItem(title: "Coconut", subtitle: "Fruit", systemImage: "leaf.fill"),
        SearchItem(title: "Dragonfruit", subtitle: "Fruit", systemImage: "leaf.fill"),
        SearchItem(title: "Grapefruit", subtitle: "Fruit", systemImage: "leaf.fill"),
        SearchItem(title: "Kiwi", subtitle: "Fruit", systemImage: "leaf.fill"),
        SearchItem(title: "Lemon", subtitle: "Fruit", systemImage: "leaf.fill"),
        SearchItem(title: "Mango", subtitle: "Fruit", systemImage: "leaf.fill"),
        SearchItem(title: "Almond", subtitle: "Nut", systemImage: "circle.grid.2x2.fill"),
        SearchItem(title: "Cashew", subtitle: "Nut", systemImage: "circle.grid.2x2.fill"),
        SearchItem(title: "Hazelnut", subtitle: "Nut", systemImage: "circle.grid.2x2.fill"),
        SearchItem(title: "Peanut", subtitle: "Nut", systemImage: "circle.grid.2x2.fill"),
        SearchItem(title: "Pistachio", subtitle: "Nut", systemImage: "circle.grid.2x2.fill"),
        SearchItem(title: "Walnut", subtitle: "Nut", systemImage: "circle.grid.2x2.fill"),
        SearchItem(title: "Broccoli", subtitle: "Vegetable", systemImage: "carrot.fill"),
        SearchItem(title: "Carrot", subtitle: "Vegetable", systemImage: "carrot.fill"),
        SearchItem(title: "Cucumber", subtitle: "Vegetable", systemImage: "carrot.fill"),
        SearchItem(title: "Eggplant", subtitle: "Vegetable", systemImage: "carrot.fill"),
        SearchItem(title: "Pepper", subtitle: "Vegetable", systemImage: "carrot.fill"),
        SearchItem(title: "Potato", subtitle: "Vegetable", systemImage: "carrot.fill"),
        SearchItem(title: "Pumpkin", subtitle: "Vegetable", systemImage: "carrot.fill"),
        SearchItem(title: "Spinach", subtitle: "Vegetable", systemImage: "carrot.fill"),
        SearchItem(title: "Tomato", subtitle: "Vegetable", systemImage: "carrot.fill"),
        SearchItem(title: "Cinnamon", subtitle: "Spice", systemImage: "flame.fill"),
        SearchItem(title: "Ginger", subtitle: "Spice", systemImage: "flame.fill"),
        SearchItem(title: "Nutmeg", subtitle: "Spice", systemImage: "flame.fill"),
        SearchItem(title: "Paprika", subtitle: "Spice", systemImage: "flame.fill"),
        SearchItem(title: "Saffron", subtitle: "Spice", systemImage: "flame.fill"),
        SearchItem(title: "Turmeric", subtitle: "Spice", systemImage: "flame.fill"),
        SearchItem(title: "Vanilla", subtitle: "Spice", systemImage: "flame.fill")
    ]
}
