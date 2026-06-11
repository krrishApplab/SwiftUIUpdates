# AGENTS.md

# SwiftUIUpdates AI Agent Rules

## Core Rules

* Follow SwiftUI best practices.
* Keep views small, modular, and reusable.
* Follow MVVM architecture.
* Prefer SwiftUI over UIKit unless explicitly requested.
* Avoid force unwrapping unless absolutely necessary.
* Avoid unnecessary comments and emojis.
* Use meaningful names.
* Keep files focused on a single responsibility.
* Do not modify unrelated stable features.
* Prefer additive changes over destructive changes.

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

## SwiftUI Rules

* Use `NavigationStack`.
* Use `@StateObject` for owned ViewModels.
* Use `@ObservedObject` for injected ViewModels.
* Use `@Binding` for child-to-parent communication.
* Use `@MainActor` for UI updates.
* Use `.task` for async loading when suitable.
* Avoid business logic inside Views.
* Support Light and Dark mode.
* Use theme-based colors from assets.
* Use localization for user-facing text.
* Support accessibility and Dynamic Type.
* Add accessibility identifiers where needed for Appium testing.
* Use `TextViewLocal` for Texts whenever possible.
* Use `ViewTextField` for TextFields whenever possible.
* Do not add an empty line after `// MARK: -`.

## Architecture

* Follow MVVM.
* Keep Views lightweight.
* Put business logic inside ViewModels, services, or repositories.
* Use dependency injection where suitable.
* Use protocol-oriented design where useful.
* Avoid massive Views and ViewModels.

## Testing

* Appium is the primary UI testing method.
* Add or update Appium tests only when UI behaviour meaningfully changes.
* Do not create dummy or empty tests.
* Do not run unit tests unless explicitly requested.
* If no Appium test is needed, mention the reason in the change log.

## Git

* Do not commit directly from the agent.
* Build, Appium test execution, report generation, and commit are handled by the post-task terminal hook.
* Do not say Appium tests were skipped only because simulator/Appium is not running; the terminal hook handles execution.
* Do not push automatically.
* Always ask before pushing.

## Change Log

After every task, provide a short change log including:

* Files created
* Files modified
* UI changes
* Logic changes
* Accessibility/localization updates
* Appium tests added/updated/skipped
* Testing result or reason if not run
* HTML report path if generated

## Appium Execution

The post-task terminal hook automatically:

* Builds the app.
* Boots the simulator.
* Installs the latest build.
* Starts Appium through WebDriverIO.
* Executes Appium tests.
* Generates the HTML report.
* Opens the report.
* Handles commit workflow.


Do not state that Appium tests were skipped because the simulator or Appium server is not running.
Do not instruct the user to manually run npm test unless specifically troubleshooting Appium.
Assume the terminal hook will execute the tests after implementation.
