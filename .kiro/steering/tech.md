# Tech Stack

## App

- **Language:** Swift (latest stable)
- **UI:** SwiftUI (prefer over UIKit unless explicitly required)
- **Architecture:** MVVM; keep Views lightweight, business logic in
  ViewModels/services. Prefer value types (`struct`) and protocol-oriented
  design.
- **State:** Prefer Swift Observation (`@Observable`) for iOS 17+; `@StateObject`
  for owned ViewModels, `@ObservedObject` for injected ones, `@Binding` for
  child-to-parent. Use async/await for async work.
- **Persistence:** SwiftData when needed; `AppStorage` for lightweight
  preferences; Keychain for sensitive data.
- **Navigation:** `NavigationStack` (not deprecated navigation APIs).
- **Dependencies:** Prefer native Apple frameworks. Use Swift Package Manager.
  No CocoaPods. Ask before adding new dependencies.

## Build system

Xcode project (`SwiftUIUpdates.xcodeproj`), scheme `SwiftUIUpdates`, bundle id
`com.krishnaraj.SwiftUIUpdates`. The `.xcodeproj` lives at the repository root,
with Swift sources in the `SwiftUIUpdates/` subfolder. This project uses explicit
file references (not synchronized folders), so new source files must be added to
`project.pbxproj` (build file, file reference, group membership, and the Sources
build phase) and the correct target.

## UI Testing

Appium + WebdriverIO (Mocha) under `SwiftUIUpdatesUITests/Appium`. Appium is the
primary UI testing method. Do not run unit tests automatically unless requested.
New screens/components should expose accessibility identifiers for Appium.

## Common commands

Run from the repository root (the folder containing `SwiftUIUpdates.xcodeproj`).

### Build

```bash
xcodebuild build -scheme SwiftUIUpdates -project SwiftUIUpdates.xcodeproj -destination 'platform=iOS Simulator,name=iPhone 16'
```

### List schemes/targets

```bash
xcodebuild -list -project SwiftUIUpdates.xcodeproj
```

### Boot simulator and install app

```bash
xcrun simctl boot "iPhone 16" || true
xcrun simctl install booted "$(find ~/Library/Developer/Xcode/DerivedData/SwiftUIUpdates-*/Build/Products/Debug-iphonesimulator -maxdepth 1 -name 'SwiftUIUpdates.app' | head -1)"
```

### Appium UI tests

Run from `SwiftUIUpdatesUITests/Appium`. Install deps only if `node_modules` is
missing (`npm install`; use `--cache /tmp/npm-cache` on `EACCES`).

```bash
npm test          # run tests, generate HTML report, open in browser
npm run test:report   # run tests + HTML report, no browser
npm run test:ci       # run tests only (CI/unattended)
```

HTML report output: `SwiftUIUpdatesUITests/Appium/Reports/appium-report.html`.
