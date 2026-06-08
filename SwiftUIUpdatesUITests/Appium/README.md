# Appium UI Tests

Appium + WebdriverIO UI tests for the SwiftUIUpdates iOS app, with HTML reporting.

## Structure

```
Appium/
├── Tests/        Test specs (*.test.js)
├── Config/       WebdriverIO configuration
├── Helpers/      Capabilities and shared tab model
├── Reports/      Generated HTML/JSON reports
├── package.json
└── README.md
```

## Prerequisites

These tools are not installed by this project. Install them before running tests:

- Node.js 18+ and npm
- Xcode with an iOS Simulator (iPhone 16, iOS 26.1)
- Appium 2 and the XCUITest driver

## Setup

```bash
cd SwiftUIUpdatesUITests/Appium
npm install
```

If the Appium XCUITest driver is not installed:

```bash
npx appium driver install xcuitest
```

Before running, make sure the app is built and installed on a booted simulator:

```bash
xcodebuild build -scheme SwiftUIUpdates -project SwiftUIUpdates.xcodeproj \
  -destination 'platform=iOS Simulator,name=iPhone 16'
xcrun simctl boot "iPhone 16" || true
xcrun simctl install booted \
  "$(find ~/Library/Developer/Xcode/DerivedData/SwiftUIUpdates-*/Build/Products/Debug-iphonesimulator -maxdepth 1 -name 'SwiftUIUpdates.app' | head -1)"
```

## Running Tests

The WebdriverIO Appium service starts and stops the Appium server automatically.

```bash
npm test
```

`npm test` runs the suite, generates the HTML report, prints its path, and opens the report in your default browser.

For CI or unattended runs (no browser opened):

```bash
npm run test:ci
```

## Generating the HTML Report

```bash
npm run test:report
```

This runs the suite and writes the report after completion (without opening a browser).

## Where to Find the Report

```
SwiftUIUpdatesUITests/Appium/Reports/appium-report.html
```

Open it manually any time:

```bash
open SwiftUIUpdatesUITests/Appium/Reports/appium-report.html
```

The `Reports/` folder also contains the intermediate JSON used to build the HTML and a `screenshots/` folder.

## Accessibility Identifiers

Tab content views expose these identifiers (defined in `MainTabView.swift`):

- `tab.home`
- `tab.search`
- `tab.favorites`
- `tab.profile`

Tab bar buttons are located by a class chain scoped to the tab bar
(`**/XCUIElementTypeTabBar/**/XCUIElementTypeButton`) and matched by their titles.

## Troubleshooting

- "element not found": confirm the app is installed on the booted simulator and the bundle id in `Helpers/capabilities.js` matches `com.krishnaraj.SwiftUIUpdates`.
- "could not connect to Appium": ensure no other process holds port 4723; the `appium` service launches its own server.
- Driver missing: run `npx appium driver install xcuitest`.
- Wrong simulator: update `appium:deviceName` / `appium:platformVersion` in `Helpers/capabilities.js`.
- npm cache permission errors (`EACCES` on `~/.npm`): install with a local cache, e.g. `npm install --cache /tmp/npm-cache`.
- Empty report: the report is created in `onComplete`; make sure the run finished and check `Reports/appium-report-*.json` exists.
