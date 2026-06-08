# SwiftUI Project AI Rules

* Keep views small, modular, and reusable.
* Prefer composition over inheritance.
* Avoid unnecessary comments and emojis.
* Use meaningful variable, method, and type names.
* Follow Swift naming conventions and Apple Human Interface Guidelines.
* Prefer value types (`struct`) over classes whenever possible.
* Avoid force unwrapping (`!`) unless absolutely necessary.
* Keep files focused on a single responsibility.

## Architecture

* Follow MVVM architecture.
* Separate UI, business logic, and networking clearly.
* Keep Views lightweight.
* Business logic should remain inside ViewModels/services.
* Use protocol-oriented programming whenever appropriate.
* Use dependency injection for services/managers.
* Avoid massive ViewModels and massive Views.
* Use extensions to organize code cleanly.

## SwiftUI Rules

* Prefer SwiftUI over UIKit unless explicitly required.
* Use reusable custom views for repeated UI components.
* Avoid deeply nested view hierarchies.
* Break complex views into smaller subviews.
* Use `@StateObject` for owned ViewModels.
* Use `@ObservedObject` for injected observable objects.
* Use `@EnvironmentObject` only when truly necessary.
* Prefer `@Binding` for child-to-parent communication.
* Use `NavigationStack` instead of deprecated navigation APIs.
* Use `.task` instead of `.onAppear` for async operations when possible.
* Use `@MainActor` for UI-related updates.
* Avoid heavy logic directly inside SwiftUI Views.
* Support Dynamic Type and Accessibility.
* Support both Light and Dark mode.
* Always create theme-based colors in `Colors.xcassets` based on Appearance.
* Use localization (`Localizable.strings`) for all user-facing text.
* Support both LTR and RTL layouts unless specified otherwise.
* Always handle keyboard appearance properly for forms and input screens.
* Move or adjust content automatically when the keyboard appears/disappears.
* Ensure focused text fields remain visible while editing.
* Add a keyboard toolbar/accessory with a `Done` button to dismiss the keyboard whenever appropriate.
* Prefer SwiftUI `.toolbar(placement: .keyboard)` for keyboard dismissal actions.
* Avoid input fields being hidden behind the keyboard.
* Ensure forms remain scrollable when the keyboard is visible.
* Do not add empty line after `// MARK: -`
* Use `TextViewLocal` for Texts whenever possible.
* Use `ViewTextField` for TextField whenever possible.

## Folder Structure

Use this structure:

```text
SwiftUIUpdates/
├── Application/
│   └── SwiftUIUpdatesApp.swift
├── Core/
│   ├── Extensions/
│   ├── Helpers/
│   ├── Managers/
│   ├── Networking/
│   ├── Services/
│   ├── Theme/
│   ├── Models/
│   └── Utils/
├── Features/
│   └── FeatureName/
│       ├── Models/
│       ├── ViewModels/
│       ├── Views/
│       ├── Components/
│       ├── Services/
│       └── Repositories/
├── Resources/
│   ├── Assets.xcassets/
│   ├── Fonts/
│   └── Localizations/
├── SwiftUIUpdatesUnitTests/
│   ├── ViewModels/
│   ├── Services/
│   ├── Repositories/
│   └── Helpers/
└── SwiftUIUpdatesUITests/
    └── Appium/
        ├── Tests/
        ├── Config/
        ├── Helpers/
        ├── Reports/
        ├── package.json
        └── README.md
```

## State Management

* Use MVVM with Combine or Swift Observation framework.
* Prefer Swift Observation (`@Observable`) for iOS 17+ projects when suitable.
* Avoid storing business logic inside Views.
* Avoid global mutable state.
* Use async/await for asynchronous operations.
* Cancel unnecessary async tasks properly.

## Networking

* Use `URLSession` for networking unless another library is requested.
* Create reusable API service layers.
* Handle API errors properly.
* Use Codable models for parsing JSON.
* Handle loading, empty, error, and success states properly.
* Handle no-network scenarios gracefully.
* Avoid networking code directly inside Views.

## Persistence

* Use SwiftData when persistence is needed.
* Use AppStorage for lightweight settings/preferences.
* Avoid storing sensitive data in AppStorage.
* Use Keychain for sensitive information.

## Styling

* Use centralized theme/colors/fonts.
* Avoid hardcoded colors and dimensions unless necessary.
* Use spacing constants.
* Prefer adaptive layouts using:

  * GeometryReader
  * ViewThatFits
  * Adaptive stacks/grids
* Follow Apple Human Interface Guidelines.
* Maintain consistent padding, spacing, and typography.

## Performance

* Avoid unnecessary view redraws.
* Use lazy containers (`LazyVStack`, `LazyHGrid`, etc.) for large datasets.
* Optimize image loading and caching.
* Avoid blocking the main thread.
* Profile performance when needed.
* Prevent retain cycles using `[weak self]` when appropriate.
* Dispose/cancel observers and tasks properly.

## Accessibility

* Support VoiceOver.
* Provide localized accessibility labels and hints to all important UI elements.
* Ensure sufficient color contrast.
* Support Dynamic Type properly.
* Ensure tappable areas are accessible.
* Add accessibility identifiers to UI elements required for Appium testing.
* Every new screen or major UI component should include useful accessibility identifiers.

## Code Style

* Keep functions short and focused.
* Avoid duplicate code.
* Prefer early returns to reduce nesting.
* Use MARK comments for section organization.
* Group related extensions together.
* Avoid unnecessary singletons.

## Third-Party Libraries

* Prefer native Apple frameworks first.
* Use Swift Package Manager whenever possible.
* Avoid adding large dependencies for small tasks.
* Avoid adding CocoaPods.
* Keep dependencies updated.
* Ask approval before adding new dependencies.

## Project Commands

These are the standard pre-approved commands for this project.

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

Run from:

```bash
cd SwiftUIUpdatesUITests/Appium
```

Install dependencies only if `node_modules` is missing:

```bash
npm install
```

Run Appium tests, generate HTML report, print report path, and open report in browser:

```bash
npm test
```

Run Appium tests without opening browser:

```bash
npm run test:ci
```

Run Appium tests with HTML report but without opening browser:

```bash
npm run test:report
```

Install Appium XCUITest driver only if missing:

```bash
appium driver install xcuitest
```

### Notes

* Do not install global tools without approval.
* The WebdriverIO Appium service should start and stop the Appium server automatically.
* No separate `appium` server command is required unless the existing setup specifically needs it.
* HTML report output must be:

```text
SwiftUIUpdatesUITests/Appium/Reports/appium-report.html
```

* If npm hits an `EACCES` cache error, use:

```bash
npm install --cache /tmp/npm-cache
```

## Testing Rules

* Appium is the primary UI testing method for this project.
* Do not run unit tests automatically unless explicitly requested.
* Do not create dummy or empty test files.
* Add or update Appium tests when a prompt changes:

  * App launch
  * Tab navigation
  * Forms
  * Button actions
  * Validation messages
  * Keyboard handling
  * Accessibility identifiers
  * Important Light/Dark mode screens
  * Important LTR/RTL layout screens
* Prefer adding only meaningful Appium tests related to the changed feature.
* Do not test unrelated stable features.
* Do not create excessive tests for minor visual-only changes.
* If no Appium test is needed, clearly mention why in the change log.
* After completing each prompt/task, run Appium tests if UI behaviour was affected.
* If tests cannot run due to missing simulator, missing dependency, or environment issue, mention the reason in the change log.

## Appium Report Rules

After Appium test execution:

1. Generate the HTML report inside:

```text
SwiftUIUpdatesUITests/Appium/Reports/
```

2. Use this report file name:

```text
appium-report.html
```

3. Print the full report path in terminal/output.

Example:

```text
Appium HTML report generated at:
SwiftUIUpdatesUITests/Appium/Reports/appium-report.html
```

4. Open the generated report automatically in the default browser for normal local runs.

For macOS:

```bash
open SwiftUIUpdatesUITests/Appium/Reports/appium-report.html
```

5. Do not open the browser for CI/unattended test runs.

## AI Agent Rules

* The agent may create, modify, and delete project files automatically.
* Do not ask for approval for normal code edits.
* Ask approval only for:

  * Dependency changes
  * Deleting large folders
  * Environment/config changes
  * Global tool installation
  * System configuration changes
* When creating, moving, renaming, or restructuring files/folders:

  * Ensure all files are properly added to the `.xcodeproj`.
  * Do not create broken file references.
  * Add new files to the correct target membership automatically.
  * Prefer Xcode groups/yellow folders instead of folder references/blue folders.
  * Ensure files exist physically inside the project directory.
  * Keep the Xcode navigator structure synchronized with the filesystem.
  * After restructuring, verify the project builds successfully.
  * Remove stale or invalid references from the project.

## Existing Code Protection

* Do not modify already completed/stable features unless explicitly requested.
* Limit changes only to files directly related to the current task.
* Avoid refactoring unrelated code.
* Do not rename, move, or restructure existing files unless explicitly requested.
* Do not alter existing UI, business logic, localization, accessibility, or theme behavior outside the requested scope.
* Preserve backward compatibility with existing features.
* Before editing shared/reusable components, verify whether the change could affect other screens/features.
* Prefer additive changes over destructive modifications.
* Avoid touching working code that is unrelated to the task.

## Output Style

* Always generate complete working Swift code.
* Do not generate pseudo code.
* Follow latest Swift and SwiftUI best practices.
* Explain only when requested.
* Keep final summaries short and clear.
* Always include a concise change log after modifications.

## Version Support

* Target latest stable Swift and SwiftUI versions unless specified.
* Prefer modern APIs over deprecated APIs.
* Mention deployment target requirements when needed.

## Change Logs

Create bulleted change logs for every modification made.

Clearly mention:

* Files created
* Files modified
* Major UI changes
* Logic changes
* Bug fixes
* Localization/accessibility updates
* Appium tests created/updated
* Appium test execution result
* HTML report path
* Skipped tests and reason, if any

## Final Task Completion Checklist

Before marking a task complete:

* Confirm requested implementation is complete.
* Confirm unrelated stable code was not modified.
* Confirm accessibility identifiers were added where Appium needs them.
* Confirm Appium tests were added or updated if needed.
* Run Appium tests if UI flow was affected.
* Generate the Appium HTML report.
* Print the report path.
* Open the report in browser for local runs.
* Provide a concise change log.

## Git Rules

After completing a task:

1. Review all changed files.
2. Verify project builds successfully.
3. Generate a meaningful commit message.
4. Run:

git add .
git commit -m "<generated message>"

5. Show the commit summary.
6. Ask before pushing to remote.
