# TESTING.md

# SwiftUIUpdates Testing Rules

Use this file only when the task involves UI testing, Appium, reports, simulator setup, accessibility identifiers, or test execution.

## Testing Policy

* Appium is the primary UI testing method.
* Do not run unit tests automatically.
* Add or update Appium tests only when the task meaningfully changes UI behaviour.

Examples:

* App launch
* Tab navigation
* Forms
* Buttons
* Validation messages
* Keyboard handling
* Accessibility identifiers
* Important Light/Dark mode screens
* Important LTR/RTL screens

## Appium Folder

```text
SwiftUIUpdatesUITests/Appium/
├── Tests/
├── Config/
├── Helpers/
├── Reports/
├── package.json
└── README.md
```

## Appium Rules

* Add or update Appium tests only when UI behaviour changes.
* Do not create dummy tests.
* Add accessibility identifiers only where required for testing.


## Report Rules

* Generate report here:

```text
SwiftUIUpdatesUITests/Appium/Reports/appium-report.html
```

* Print the report path.
* Open the report in browser for local runs.
* Do not open browser for CI runs.
