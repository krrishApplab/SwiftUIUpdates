//
//  SwiftUIUpdatesApp.swift
//  SwiftUIUpdates
//
//  Created by Krishna Raj on 08/06/26.
//

import SwiftUI
import UIKit

@main
struct SwiftUIUpdatesApp: App {

    @AppStorage("appTheme") private var appTheme: AppTheme = .dark

    init() {
        Self.configureNavigationTitleAppearance()
    }

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .preferredColorScheme(appTheme.colorScheme)
        }
    }

    // MARK: - Appearance
    static func configureNavigationTitleAppearance() {
        let titleColor = UIColor.systemGreen
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        appearance.titleTextAttributes = [.foregroundColor: titleColor]
        appearance.largeTitleTextAttributes = [.foregroundColor: titleColor]

        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
    }
}

/*
 Make reasonable assumptions.
 Do not ask for confirmation unless blocked.
 
 
 Add dark mode support.
 Preserve all existing functionality.
 
 
 //--------------------------------------------------//
 Create a side menu.

 Requirements:
 - Show Home, Settings, Profile.
 - Support iPhone and iPad.

 Constraints:
 - No third-party libraries.
 - Preserve existing navigation.

 Done when:
 - Build succeeds.
 - Side menu is accessible from all tabs.

 Follow AGENTS.md.
 //--------------------------------------------------//
 
 
*/
