//
//  SearchView.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .imageScale(.large)
                    .font(.largeTitle)
                    .foregroundStyle(.tint)
                Text("Search")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    SearchView()
}
