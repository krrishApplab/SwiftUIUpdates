//
//  ProfileViewModel.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import Observation
import SwiftUI

struct ProfileStatistic: Identifiable {
    let id = UUID()
    let title: String
    let value: String
    let systemImage: String
    let accessibilityIdentifier: String
}

@Observable
final class ProfileViewModel {

    // MARK: - Profile
    var name: String
    var email: String
    var avatarSystemImage: String

    // MARK: - Statistics
    var statistics: [ProfileStatistic]

    // MARK: - Init
    init(
        name: String = "Krishna Raj",
        email: String = "krishna.raj@example.com",
        avatarSystemImage: String = "person.crop.circle.fill",
        statistics: [ProfileStatistic] = ProfileViewModel.sampleStatistics
    ) {
        self.name = name
        self.email = email
        self.avatarSystemImage = avatarSystemImage
        self.statistics = statistics
    }

    // MARK: - Editing
    func updateProfile(name: String, email: String) {
        let trimmedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)

        if !trimmedName.isEmpty {
            self.name = trimmedName
        }
        if !trimmedEmail.isEmpty {
            self.email = trimmedEmail
        }
    }

    // MARK: - Sample Data
    static let sampleStatistics: [ProfileStatistic] = [
        ProfileStatistic(title: "Posts", value: "128", systemImage: "square.grid.2x2.fill", accessibilityIdentifier: "profile.stat.posts"),
        ProfileStatistic(title: "Followers", value: "8.6K", systemImage: "person.2.fill", accessibilityIdentifier: "profile.stat.followers"),
        ProfileStatistic(title: "Following", value: "342", systemImage: "person.badge.plus.fill", accessibilityIdentifier: "profile.stat.following"),
        ProfileStatistic(title: "Likes", value: "24.1K", systemImage: "heart.fill", accessibilityIdentifier: "profile.stat.likes")
    ]
}
