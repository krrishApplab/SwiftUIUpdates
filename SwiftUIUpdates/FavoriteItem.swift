//
//  FavoriteItem.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 09/06/26.
//

import Foundation

struct FavoriteItem: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let subtitle: String
    let systemImage: String
}
