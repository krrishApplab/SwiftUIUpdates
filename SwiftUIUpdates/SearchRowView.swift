//
//  SearchRowView.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 09/06/26.
//

import SwiftUI

struct SearchRowView: View {
    let item: SearchItem

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
                    .fontWeight(.semibold)
                Text(item.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer(minLength: 0)
        }
        .padding(.vertical, 4)
        .contentShape(Rectangle())
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(item.title), \(item.subtitle)")
    }
}

#Preview {
    List {
        SearchRowView(
            item: SearchItem(title: "Avocado", subtitle: "Fruit", systemImage: "leaf.fill")
        )
    }
}
