import XCTest
import SwiftUI
@testable import SwiftUIUpdates

final class MainTabViewTests: XCTestCase {

    // MARK: - Tab Configuration
    func testMainTabViewExposesFiveTabs() {
        XCTAssertEqual(MainTabView.tabConfigurations.count, 5)
    }

    func testTabConfigurationsHaveExpectedTitles() {
        let titles = MainTabView.tabConfigurations.map(\.title)
        XCTAssertEqual(titles, ["Home", "Search", "Favorites", "Profile", "Settings"])
    }

    func testTabConfigurationsHaveExpectedSystemImages() {
        let images = MainTabView.tabConfigurations.map(\.systemImage)
        XCTAssertEqual(images, ["house", "magnifyingglass", "heart", "person", "gearshape"])
    }

    func testEveryTabHasAccessibilityIdentifier() {
        for configuration in MainTabView.tabConfigurations {
            XCTAssertFalse(configuration.accessibilityIdentifier.isEmpty)
        }
    }

    func testSelectedTintColorIsGreen() {
        XCTAssertEqual(MainTabView.selectedTabTint, .green)
    }
}
