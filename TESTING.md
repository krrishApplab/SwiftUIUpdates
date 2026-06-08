# TESTING.md

# SwiftUIUpdates Testing Rules

Use this file only when the task involves:

* Appium
* UI testing
* Test reports
* Simulator setup
* Accessibility identifiers for testing
* Running or fixing tests
* Test-related commands

## Testing Policy

* Appium is the primary UI testing method for this project.
* Do not run Appium tests automatically unless explicitly requested.
* Do not run unit tests automatically unless explicitly requested.
* Do not create dummy or empty test files.
* Add or update Appium tests only when the task meaningfully changes UI behavior.

Examples:

* App launch
* Tab navigation
* Forms
* Button actions
* Validation messages
* Keyboard handling
* Accessibility identifiers
* Important Light/Dark mode screens
* Important LTR/RTL layout screens

## Appium Test Guidelines

* Add only meaningful Appium tests related to the changed feature.
* Do not test unrelated stable features.
* Do not create excessive tests for minor visual-only changes.
* If no Appium test is needed, mention why in the change log.
* If tests cannot run due to missing simulator, missing dependency, or environment issue, mention the reason clearly.

## Appium Folder

Appium files should be located here:

```text
SwiftUIUpdatesUITests/Appium/
├── Tests/
├── Config/
├── Helpers/
├── Reports/
├── package.json
└── README.md
```

## Commands

### Go to Appium folder

```bash
cd SwiftUIUpdatesUITests/Appium
```

### Install dependencies only if `node_modules` is missing

```bash
npm install
```

If npm hits an `EACCES` cache error:

```bash
npm install --cache /tmp/npm-cache
```

### Run Appium tests, generate HTML report, print report path, and open report

```bash
npm test
```

### Run Appium tests without opening browser

```bash
npm run test:ci
```

### Run Appium tests with HTML report but without opening browser

```bash
npm run test:report
```

### Install Appium XCUITest driver only if missing

```bash
appium driver install xcuitest
```

## Appium Server Rule

* The WebdriverIO Appium service should start and stop the Appium server automatically.
* No separate `appium` server command is required unless the current setup specifically needs it.

## HTML Report Rules

After Appium test execution:

* Generate the HTML report inside:

```text
SwiftUIUpdatesUITests/Appium/Reports/
```

* Use this exact file name:

```text
appium-report.html
```

* Print the report path:

```text
Appium HTML report generated at:
SwiftUIUpdatesUITests/Appium/Reports/appium-report.html
```

* Open the generated report automatically only for normal local runs:

```bash
open SwiftUIUpdatesUITests/Appium/Reports/appium-report.html
```

* Do not open the browser for CI/unattended test runs.

## Build and Simulator Commands

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

## Test Change Log

When tests are involved, mention:

* Appium tests created/updated
* Appium test execution result
* HTML report path
* Skipped tests and reason, if any
