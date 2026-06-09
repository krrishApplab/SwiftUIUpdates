//
//  FavoriteRowView.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 09/06/26.
//

import SwiftUI

struct FavoriteRowView: View {
    let item: FavoriteItem

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: item.systemImage)
                .font(.title3)
                .foregroundStyle(.tint)
                .frame(width: 40, height: 40)
                .background(.tint.opacity(0.15), in: Circle())

            VStack(alignment: .leading, spacing: 2) {
                Text(item.title)
                    .font(.body)
                    .fontWeight(.medium)
                Text(item.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer(minLength: 0)

            Image(systemName: "heart.fill")
                .font(.subheadline)
                .foregroundStyle(.tint)
        }
        .padding(.vertical, 4)
        .contentShape(Rectangle())
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(item.title), \(item.subtitle)")
        .accessibilityIdentifier("favorites.row.\(item.title)")
    }
}

#Preview {
    List {
        FavoriteRowView(
            item: FavoriteItem(
                title: "Morning Run",
                subtitle: "Fitness",
                systemImage: "figure.run"
            )
        )
    }
}
