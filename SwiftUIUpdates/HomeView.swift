//
//  HomeView.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                Image(systemName: "house")
                    .imageScale(.large)
                    .font(.largeTitle)
                    .foregroundStyle(.tint)
                Text("Home")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    HomeView()
}
