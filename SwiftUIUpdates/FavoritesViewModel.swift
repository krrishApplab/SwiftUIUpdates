//
//  FavoritesViewModel.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 09/06/26.
//

import Foundation
import Observation

@Observable
final class FavoritesViewModel {

    // MARK: - State
    var searchText: String = ""
    private(set) var items: [FavoriteItem]

    // MARK: - Init
    init(items: [FavoriteItem] = FavoritesViewModel.sampleItems) {
        self.items = items
    }

    // MARK: - Filtering
    var filteredItems: [FavoriteItem] {
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

    // MARK: - Sample Data
    static let sampleItems: [FavoriteItem] = [
        FavoriteItem(title: "Morning Run", subtitle: "Fitness", systemImage: "figure.run"),
        FavoriteItem(title: "Espresso Recipe", subtitle: "Food & Drink", systemImage: "cup.and.saucer.fill"),
        FavoriteItem(title: "Jazz Playlist", subtitle: "Music", systemImage: "music.note.list"),
        FavoriteItem(title: "Mountain Trail", subtitle: "Travel", systemImage: "mountain.2.fill"),
        FavoriteItem(title: "SwiftUI Tips", subtitle: "Development", systemImage: "swift"),
        FavoriteItem(title: "Reading List", subtitle: "Books", systemImage: "books.vertical.fill"),
        FavoriteItem(title: "Weekend Photos", subtitle: "Photography", systemImage: "camera.fill"),
        FavoriteItem(title: "Budget Tracker", subtitle: "Finance", systemImage: "dollarsign.circle.fill"),
        FavoriteItem(title: "Meditation", subtitle: "Wellness", systemImage: "leaf.fill"),
        FavoriteItem(title: "Pasta Night", subtitle: "Food & Drink", systemImage: "fork.knife"),
        FavoriteItem(title: "Sci-Fi Movies", subtitle: "Entertainment", systemImage: "film.fill"),
        FavoriteItem(title: "Garden Plans", subtitle: "Home", systemImage: "tree.fill"),
        FavoriteItem(title: "Cycling Route", subtitle: "Fitness", systemImage: "bicycle"),
        FavoriteItem(title: "Coding Podcast", subtitle: "Development", systemImage: "mic.fill"),
        FavoriteItem(title: "Beach Sunset", subtitle: "Travel", systemImage: "sun.max.fill"),
        FavoriteItem(title: "Yoga Flow", subtitle: "Wellness", systemImage: "figure.yoga"),
        FavoriteItem(title: "Tech News", subtitle: "Reading", systemImage: "newspaper.fill"),
        FavoriteItem(title: "Guitar Practice", subtitle: "Music", systemImage: "guitars.fill"),
        FavoriteItem(title: "Recipe Ideas", subtitle: "Food & Drink", systemImage: "carrot.fill"),
        FavoriteItem(title: "Star Gazing", subtitle: "Outdoors", systemImage: "moon.stars.fill"),
        FavoriteItem(title: "Design Inspiration", subtitle: "Creativity", systemImage: "paintpalette.fill"),
        FavoriteItem(title: "Weekend Hike", subtitle: "Outdoors", systemImage: "figure.hiking")
    ]
}
