# SwiftUI Project AI Rules

## Core Rules

* Keep views small, modular, and reusable.
* Prefer composition over inheritance.
* Avoid unnecessary comments and emojis.
* Use meaningful variable, method, and type names.
* Follow Swift naming conventions and Apple Human Interface Guidelines.
* Prefer value types (`struct`) over classes whenever possible.
* Avoid force unwrapping (`!`) unless absolutely necessary.
* Keep files focused on a single responsibility.
* Generate complete working Swift code, not pseudo code.
* Keep final summaries short and clear.

## Architecture

* Follow MVVM architecture.
* Keep Views lightweight.
* Keep business logic inside ViewModels, services, or repositories.
* Separate UI, business logic, networking, persistence, and models clearly.
* Use dependency injection where suitable.
* Avoid massive Views and massive ViewModels.
* Prefer protocol-oriented programming when useful.
* Avoid unnecessary singletons.
* Avoid global mutable state.

## SwiftUI Rules

* Prefer SwiftUI over UIKit unless explicitly required.
* Use reusable custom views for repeated UI components.
* Break complex views into smaller subviews.
* Avoid deeply nested view hierarchies.
* Use `@StateObject` for owned ViewModels.
* Use `@ObservedObject` for injected observable objects.
* Use `@EnvironmentObject` only when truly necessary.
* Prefer `@Binding` for child-to-parent communication.
* Use `NavigationStack` instead of deprecated navigation APIs.
* Use `.task` instead of `.onAppear` for async operations when appropriate.
* Use `@MainActor` for UI-related updates.
* Avoid heavy logic directly inside SwiftUI Views.
* Do not add an empty line after `// MARK: -`
* Use `TextViewLocal` for Texts whenever possible.
* Use `ViewTextField` for TextFields whenever possible.

## UI, Theme, and Localization

* Support Dynamic Type and Accessibility.
* Support both Light and Dark mode.
* Use theme-based colors in `Colors.xcassets` based on Appearance.
* Use localization (`Localizable.strings`) for all user-facing text.
* Support both LTR and RTL layouts unless specified otherwise.
* Use centralized theme, colors, fonts, and spacing constants.
* Avoid hardcoded colors and dimensions unless necessary.
* Follow Apple Human Interface Guidelines.
* Maintain consistent padding, spacing, and typography.

## Keyboard Handling

* Handle keyboard appearance properly for forms and input screens.
* Ensure focused text fields remain visible while editing.
* Keep forms scrollable when the keyboard is visible.
* Add a keyboard toolbar/accessory with a `Done` button when appropriate.
* Prefer SwiftUI `.toolbar(placement: .keyboard)` for keyboard dismissal actions.
* Avoid input fields being hidden behind the keyboard.

## Folder Structure

Follow the existing project structure.

New features should be placed under:

```text
Features/<FeatureName>/
├── Models/
├── ViewModels/
├── Views/
├── Components/
├── Services/
└── Repositories/
```

Shared code should be placed under:

```text
Core/
├── Extensions/
├── Helpers/
├── Managers/
├── Networking/
├── Services/
├── Theme/
├── Models/
└── Utils/
```

Resources should be placed under:

```text
Resources/
├── Assets.xcassets/
├── Fonts/
└── Localizations/
```

Only create folders when they are actually needed.

## State Management

* Use MVVM with Combine or Swift Observation.
* Prefer Swift Observation (`@Observable`) for iOS 17+ projects when suitable.
* Use async/await for asynchronous operations.
* Cancel unnecessary async tasks properly.

## Networking

* Use `URLSession` unless another library is explicitly requested.
* Create reusable API service layers.
* Use Codable models for JSON parsing.
* Handle loading, empty, error, and success states.
* Handle no-network scenarios gracefully.
* Avoid networking code directly inside Views.

## Persistence

* Use SwiftData when persistence is needed.
* Use AppStorage only for lightweight settings/preferences.
* Do not store sensitive data in AppStorage.
* Use Keychain for sensitive information.

## Performance

* Avoid unnecessary view redraws.
* Use lazy containers for large datasets.
* Avoid blocking the main thread.
* Optimize image loading and caching when needed.
* Prevent retain cycles using `[weak self]` where appropriate.
* Dispose/cancel observers and tasks properly.

## Accessibility

* Support VoiceOver.
* Add localized accessibility labels and hints to important UI elements.
* Ensure sufficient color contrast.
* Support Dynamic Type properly.
* Ensure tappable areas are accessible.
* Add accessibility identifiers to UI elements required for UI testing.

## Third-Party Libraries

* Prefer native Apple frameworks first.
* Use Swift Package Manager whenever possible.
* Avoid CocoaPods.
* Avoid adding large dependencies for small tasks.
* Ask approval before adding or updating dependencies.
* Ask approval before installing global tools.

## Existing Code Protection

* Do not modify completed/stable features unless explicitly requested.
* Limit changes to files directly related to the current task.
* Avoid refactoring unrelated code.
* Do not rename, move, or restructure existing files unless requested.
* Preserve existing UI, business logic, localization, accessibility, and theme behavior outside the requested scope.
* Prefer additive changes over destructive changes.
* Before editing shared components, check whether the change can affect other screens.

## Xcode Project Rules

When creating, moving, renaming, or restructuring files/folders:

* Ensure files are properly added to the `.xcodeproj`.
* Do not create broken file references.
* Add new files to the correct target membership.
* Prefer Xcode groups/yellow folders instead of folder references/blue folders.
* Ensure files exist physically inside the project directory.
* Keep Xcode navigator structure synchronized with the filesystem.
* Remove stale or invalid references when needed.

## Testing and Git

* Do not run Appium tests automatically unless explicitly requested.
* Do not run unit tests automatically unless explicitly requested.
* Do not build automatically unless explicitly requested or necessary to verify the task.
* Do not commit automatically unless explicitly requested.
* Use `TESTING.md` only when the task involves Appium, UI testing, reports, simulator, accessibility test IDs, or test execution.
* Use `GIT.md` only when the user asks to commit, check git status, create branch, push, or manage git.

## Change Log

After each task, provide a short change log mentioning only relevant items:

* Files created
* Files modified
* Major UI changes
* Logic changes
* Bug fixes
* Localization/accessibility updates
* Tests skipped and reason, if applicable
