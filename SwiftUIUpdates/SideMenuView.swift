//
//  SideMenuView.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import SwiftUI

struct SideMenuView: View {

    // MARK: - Menu Model
    struct MenuItem: Identifiable {
        let id = UUID()
        let title: String
        let systemImage: String
        let accessibilityIdentifier: String
    }

    // MARK: - State
    @Binding var isOpen: Bool

    // MARK: - Configuration
    private let menuWidth: CGFloat = 270

    static let menuItems: [MenuItem] = [
        MenuItem(title: "Home", systemImage: "house", accessibilityIdentifier: "sidemenu.home"),
        MenuItem(title: "Profile", systemImage: "person", accessibilityIdentifier: "sidemenu.profile"),
        MenuItem(title: "Settings", systemImage: "gearshape", accessibilityIdentifier: "sidemenu.settings"),
        MenuItem(title: "About", systemImage: "info.circle", accessibilityIdentifier: "sidemenu.about")
    ]

    // MARK: - Body
    var body: some View {
        ZStack(alignment: .leading) {
            if isOpen {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture { close() }
                    .accessibilityIdentifier("sidemenu.backdrop")
                    .transition(.opacity)

                menuPanel
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut(duration: 0.25), value: isOpen)
    }

    // MARK: - Menu Panel
    private var menuPanel: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Menu")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 60)

            ForEach(Self.menuItems) { item in
                Button {
                    close()
                } label: {
                    Label(item.title, systemImage: item.systemImage)
                        .font(.headline)
                }
                .buttonStyle(.plain)
                .accessibilityIdentifier(item.accessibilityIdentifier)
            }

            Spacer()
        }
        .padding(.horizontal, 24)
        .frame(width: menuWidth, alignment: .leading)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(.regularMaterial)
        .accessibilityIdentifier("sidemenu.panel")
    }

    // MARK: - Actions
    private func close() {
        isOpen = false
    }
}

#Preview {
    SideMenuView(isOpen: .constant(true))
}
