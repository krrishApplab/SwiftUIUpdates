//
//  HomeView.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import SwiftUI

struct HomeView: View {

    // MARK: - State
    @State private var isMenuOpen = false

    // MARK: - Body
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        isMenuOpen = true
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                    .accessibilityIdentifier("home.menuButton")
                }
            }
        }
        .overlay {
            SideMenuView(isOpen: $isMenuOpen)
        }
    }
}

#Preview {
    HomeView()
}
