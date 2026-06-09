//
//  StatisticCardView.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import SwiftUI

struct StatisticCardView: View {
    let statistic: ProfileStatistic

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image(systemName: statistic.systemImage)
                .font(.title3)
                .foregroundStyle(.tint)
                .frame(width: 40, height: 40)
                .background(.tint.opacity(0.15), in: Circle())

            VStack(alignment: .leading, spacing: 2) {
                Text(statistic.value)
                    .font(.title2)
                    .fontWeight(.bold)
                    .contentTransition(.numericText())
                Text(statistic.title)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(.white.opacity(0.08), lineWidth: 1)
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(statistic.title): \(statistic.value)")
        .accessibilityIdentifier(statistic.accessibilityIdentifier)
    }
}

#Preview {
    StatisticCardView(
        statistic: ProfileStatistic(
            title: "Followers",
            value: "8.6K",
            systemImage: "person.2.fill",
            accessibilityIdentifier: "profile.stat.followers"
        )
    )
    .padding()
}
