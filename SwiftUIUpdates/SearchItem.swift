//
//  SearchItem.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import Foundation

struct SearchItem: Identifiable, Hashable {
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
        "search.row." + title
            .lowercased()
            .replacingOccurrences(of: " ", with: "-")
    }
}

// MARK: - Sample Data
extension SearchItem {
    static let sampleData: [SearchItem] = [
        SearchItem(title: "SwiftUI", subtitle: "Declarative UI framework", systemImage: "swift"),
        SearchItem(title: "NavigationStack", subtitle: "Modern navigation container", systemImage: "list.bullet.rectangle"),
        SearchItem(title: "Observation", subtitle: "Observable macro for state", systemImage: "eye"),
        SearchItem(title: "Concurrency", subtitle: "async/await and tasks", systemImage: "arrow.triangle.2.circlepath"),
        SearchItem(title: "SwiftData", subtitle: "Persistence framework", systemImage: "externaldrive"),
        SearchItem(title: "Combine", subtitle: "Reactive streams", systemImage: "dot.radiowaves.left.and.right"),
        SearchItem(title: "Core Data", subtitle: "Object graph storage", systemImage: "cylinder.split.1x2"),
        SearchItem(title: "App Storage", subtitle: "Lightweight preferences", systemImage: "gearshape"),
        SearchItem(title: "Keychain", subtitle: "Secure credential storage", systemImage: "key.fill"),
        SearchItem(title: "Glass Effect", subtitle: "Dynamic material rendering", systemImage: "sparkles"),
        SearchItem(title: "Accessibility", subtitle: "Inclusive design support", systemImage: "accessibility"),
        SearchItem(title: "Dynamic Type", subtitle: "Scalable text sizes", systemImage: "textformat.size"),
        SearchItem(title: "Dark Mode", subtitle: "Adaptive color schemes", systemImage: "moon.fill"),
        SearchItem(title: "Animations", subtitle: "Fluid motion and transitions", systemImage: "wand.and.stars"),
        SearchItem(title: "Gestures", subtitle: "Tap, drag, and pinch", systemImage: "hand.tap.fill"),
        SearchItem(title: "Charts", subtitle: "Data visualization", systemImage: "chart.bar.fill"),
        SearchItem(title: "MapKit", subtitle: "Maps and location", systemImage: "map.fill"),
        SearchItem(title: "WidgetKit", subtitle: "Home screen widgets", systemImage: "square.grid.2x2.fill"),
        SearchItem(title: "Notifications", subtitle: "Local and push alerts", systemImage: "bell.fill"),
        SearchItem(title: "Networking", subtitle: "URLSession requests", systemImage: "network"),
        SearchItem(title: "JSON Decoding", subtitle: "Codable serialization", systemImage: "curlybraces"),
        SearchItem(title: "Localization", subtitle: "Multi-language support", systemImage: "globe"),
        SearchItem(title: "Testing", subtitle: "Unit and UI tests", systemImage: "checkmark.seal.fill"),
        SearchItem(title: "Previews", subtitle: "Live canvas rendering", systemImage: "eye.circle.fill"),
        SearchItem(title: "View Modifiers", subtitle: "Composable styling", systemImage: "slider.horizontal.3"),
        SearchItem(title: "Property Wrappers", subtitle: "State management tools", systemImage: "shippingbox.fill"),
        SearchItem(title: "Environment", subtitle: "Shared dependency values", systemImage: "leaf.fill"),
        SearchItem(title: "Toolbar", subtitle: "Navigation bar actions", systemImage: "wrench.and.screwdriver.fill"),
        SearchItem(title: "Sheets", subtitle: "Modal presentations", systemImage: "rectangle.portrait.bottomhalf.filled"),
        SearchItem(title: "Lists", subtitle: "Scrollable collections", systemImage: "list.bullet"),
        SearchItem(title: "Grids", subtitle: "Lazy grid layouts", systemImage: "square.grid.3x3.fill"),
        SearchItem(title: "Forms", subtitle: "Structured input UI", systemImage: "doc.plaintext.fill")
    ]
}
