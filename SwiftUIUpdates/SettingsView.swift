//
//  SettingsView.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import SwiftUI

struct SettingsView: View {

    // MARK: - Storage
    @AppStorage("appTheme") private var appTheme: AppTheme = .dark

    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                Section("Appearance") {
                    Picker("Theme", selection: $appTheme) {
                        ForEach(AppTheme.allCases) { theme in
                            Text(theme.title).tag(theme)
                        }
                    }
                    .accessibilityIdentifier("settings.theme.picker")
                }

                Section("About") {
                    LabeledContent("App Version", value: Self.appVersion)
                        .accessibilityIdentifier("settings.appVersion")
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    // MARK: - App Version
    static var appVersion: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
        return "v \(version)(\(build))"
    }
}

#Preview {
    SettingsView()
}
