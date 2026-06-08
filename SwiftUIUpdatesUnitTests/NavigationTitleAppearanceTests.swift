import XCTest
import UIKit
@testable import SwiftUIUpdates

final class NavigationTitleAppearanceTests: XCTestCase {

    func testConfiguresGreenTitleColors() {
        SwiftUIUpdatesApp.configureNavigationTitleAppearance()

        let standard = UINavigationBar.appearance().standardAppearance
        let titleColor = standard.titleTextAttributes[.foregroundColor] as? UIColor
        let largeTitleColor = standard.largeTitleTextAttributes[.foregroundColor] as? UIColor

        XCTAssertEqual(titleColor, .systemGreen)
        XCTAssertEqual(largeTitleColor, .systemGreen)
    }

    func testAppliesAppearanceToAllNavigationBarStates() {
        SwiftUIUpdatesApp.configureNavigationTitleAppearance()

        XCTAssertNotNil(UINavigationBar.appearance().standardAppearance)
        XCTAssertNotNil(UINavigationBar.appearance().scrollEdgeAppearance)
        XCTAssertNotNil(UINavigationBar.appearance().compactAppearance)
    }
}
