//
//  ProfileView.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import SwiftUI

struct ProfileView: View {

    // MARK: - State
    @State private var viewModel = ProfileViewModel()
    @State private var isEditingProfile = false

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    header
                    statisticsGrid
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 32)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isEditingProfile) {
                EditProfileView(viewModel: viewModel)
            }
        }
    }

    // MARK: - Header
    private var header: some View {
        VStack(spacing: 16) {
            Image(systemName: viewModel.avatarSystemImage)
                .resizable()
                .scaledToFit()
                .frame(width: 96, height: 96)
                .foregroundStyle(.white)
                .padding(6)
                .background(
                    Circle().fill(
                        LinearGradient(
                            colors: [.green, .teal],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                )
                .overlay(Circle().strokeBorder(.white.opacity(0.6), lineWidth: 2))
                .shadow(color: .black.opacity(0.15), radius: 10, y: 6)
                .accessibilityIdentifier("profile.avatar")

            VStack(spacing: 4) {
                Text(viewModel.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .accessibilityIdentifier("profile.name")
                Text(viewModel.email)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .accessibilityIdentifier("profile.email")
            }

            Button {
                isEditingProfile = true
            } label: {
                Label("Edit Profile", systemImage: "pencil")
                    .font(.subheadline.weight(.semibold))
                    .padding(.horizontal, 24)
                    .padding(.vertical, 10)
            }
            .buttonStyle(.borderedProminent)
            .clipShape(Capsule())
            .accessibilityIdentifier("profile.editButton")
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 28)
        .padding(.horizontal, 20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 28))
        .padding(.top, 8)
    }

    // MARK: - Statistics
    private var statisticsGrid: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(viewModel.statistics) { statistic in
                StatisticCardView(statistic: statistic)
            }
        }
        .accessibilityIdentifier("profile.statistics")
    }
}

#Preview {
    ProfileView()
}
