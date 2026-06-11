//
//  MainTabView.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import SwiftUI

struct MainTabView: View {

    // MARK: - Tab Model
    struct TabConfiguration: Identifiable, Equatable {
        let id = UUID()
        let title: String
        let systemImage: String
        let accessibilityIdentifier: String

        static func == (lhs: TabConfiguration, rhs: TabConfiguration) -> Bool {
            lhs.title == rhs.title
                && lhs.systemImage == rhs.systemImage
                && lhs.accessibilityIdentifier == rhs.accessibilityIdentifier
        }
    }

    // MARK: - Configuration
    static let selectedTabTint: Color = .green

    static let tabConfigurations: [TabConfiguration] = [
        TabConfiguration(title: "Home", systemImage: "house", accessibilityIdentifier: "tab.home"),
        TabConfiguration(title: "Search", systemImage: "magnifyingglass", accessibilityIdentifier: "tab.search"),
        TabConfiguration(title: "Favourites", systemImage: "heart", accessibilityIdentifier: "tab.favorites"),
        TabConfiguration(title: "Profile", systemImage: "person", accessibilityIdentifier: "tab.profile"),
        TabConfiguration(title: "Settings", systemImage: "gearshape", accessibilityIdentifier: "tab.settings")
    ]

    // MARK: - Body
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label(Self.tabConfigurations[0].title, systemImage: Self.tabConfigurations[0].systemImage)
                }
                .accessibilityIdentifier(Self.tabConfigurations[0].accessibilityIdentifier)

            SearchView()
                .tabItem {
                    Label(Self.tabConfigurations[1].title, systemImage: Self.tabConfigurations[1].systemImage)
                }
                .accessibilityIdentifier(Self.tabConfigurations[1].accessibilityIdentifier)

            FavoritesView()
                .tabItem {
                    Label(Self.tabConfigurations[2].title, systemImage: Self.tabConfigurations[2].systemImage)
                }
                .accessibilityIdentifier(Self.tabConfigurations[2].accessibilityIdentifier)

            ProfileView()
                .tabItem {
                    Label(Self.tabConfigurations[3].title, systemImage: Self.tabConfigurations[3].systemImage)
                }
                .accessibilityIdentifier(Self.tabConfigurations[3].accessibilityIdentifier)

            SettingsView()
                .tabItem {
                    Label(Self.tabConfigurations[4].title, systemImage: Self.tabConfigurations[4].systemImage)
                }
                .accessibilityIdentifier(Self.tabConfigurations[4].accessibilityIdentifier)
        }
        .tint(Self.selectedTabTint)
    }
}

#Preview {
    MainTabView()
}
