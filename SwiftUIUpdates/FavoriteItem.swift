//
//  FavoriteItem.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import Foundation

struct FavoriteItem: Identifiable, Hashable {
    let id: UUID
    let title: String
    let subtitle: String
    let systemImage: String

    init(id: UUID = UUID(), title: String, subtitle: String, systemImage: String) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.systemImage = systemImage
    }

    var accessibilityIdentifier: String {
        "favorites.row." + title
            .lowercased()
            .replacingOccurrences(of: " ", with: "-")
    }
}

// MARK: - Sample Data
extension FavoriteItem {
    static let sampleData: [FavoriteItem] = [
        FavoriteItem(title: "Aurora Borealis", subtitle: "Northern lights over Iceland", systemImage: "sparkles"),
        FavoriteItem(title: "Mountain Sunrise", subtitle: "Early light on the peaks", systemImage: "sunrise.fill"),
        FavoriteItem(title: "Ocean Breeze", subtitle: "Calm waves at the shore", systemImage: "water.waves"),
        FavoriteItem(title: "Forest Trail", subtitle: "A quiet walk in the woods", systemImage: "tree.fill"),
        FavoriteItem(title: "City Lights", subtitle: "Downtown after dark", systemImage: "building.2.fill"),
        FavoriteItem(title: "Desert Dunes", subtitle: "Golden sand at noon", systemImage: "sun.max.fill"),
        FavoriteItem(title: "Rainy Afternoon", subtitle: "Soft drizzle on the window", systemImage: "cloud.rain.fill"),
        FavoriteItem(title: "Cozy Cafe", subtitle: "Fresh coffee and a book", systemImage: "cup.and.saucer.fill"),
        FavoriteItem(title: "Starry Night", subtitle: "Clear skies far from the city", systemImage: "moon.stars.fill"),
        FavoriteItem(title: "Autumn Leaves", subtitle: "Red and gold in the park", systemImage: "leaf.fill"),
        FavoriteItem(title: "Snowy Cabin", subtitle: "Warm fire in the cold", systemImage: "snowflake"),
        FavoriteItem(title: "Spring Garden", subtitle: "Blooming tulips everywhere", systemImage: "camera.macro"),
        FavoriteItem(title: "Lakeside View", subtitle: "Still water at dawn", systemImage: "mountain.2.fill"),
        FavoriteItem(title: "Road Trip", subtitle: "Open highway and good music", systemImage: "car.fill"),
        FavoriteItem(title: "Beach Bonfire", subtitle: "Evening by the sea", systemImage: "flame.fill"),
        FavoriteItem(title: "Vintage Bicycle", subtitle: "A ride through old streets", systemImage: "bicycle"),
        FavoriteItem(title: "Bookstore Corner", subtitle: "Shelves full of stories", systemImage: "books.vertical.fill"),
        FavoriteItem(title: "Morning Coffee", subtitle: "The first cup of the day", systemImage: "mug.fill"),
        FavoriteItem(title: "Sunset Cruise", subtitle: "Sailing into the evening", systemImage: "sailboat.fill"),
        FavoriteItem(title: "Wildflower Field", subtitle: "Colors as far as you can see", systemImage: "fan.fill"),
        FavoriteItem(title: "Mountain Hike", subtitle: "Reaching the summit", systemImage: "figure.hiking"),
        FavoriteItem(title: "Jazz Evening", subtitle: "Live music downtown", systemImage: "music.note"),
        FavoriteItem(title: "Garden Picnic", subtitle: "Lunch under the trees", systemImage: "basket.fill"),
        FavoriteItem(title: "Northern Harbor", subtitle: "Boats resting at dusk", systemImage: "ferry.fill")
    ]
}
