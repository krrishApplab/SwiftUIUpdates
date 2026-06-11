export const config = {
    iosCapabilities: {
        platformName: 'iOS',
        'appium:automationName': 'XCUITest',
        'appium:deviceName': 'iPhone 16',
        'appium:platformVersion': '26.1',
        'appium:bundleId': 'com.krishnaraj.SwiftUIUpdates',
        'appium:autoAcceptAlerts': true
    }
}

export const tabs = [
    { title: 'Home', contentIdentifier: 'tab.home' },
    { title: 'Search', contentIdentifier: 'tab.search' },
    { title: 'Favourites', contentIdentifier: 'tab.favorites' },
    { title: 'Profile', contentIdentifier: 'tab.profile' },
    { title: 'Settings', contentIdentifier: 'tab.settings' }
]
