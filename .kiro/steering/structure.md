# Project Structure

The repository root is the Xcode project root.

```text
SwiftUIUpdates/                      # repo root (contains .git, .xcodeproj)
├── AGENTS.md                        # detailed AI working rules for this project
├── SwiftUIUpdates.xcodeproj/        # Xcode project (explicit file references)
├── SwiftUIUpdates/                  # app sources
│   ├── SwiftUIUpdatesApp.swift      # @main entry; nav bar appearance + theme
│   ├── MainTabView.swift            # root TabView wiring all five tabs
│   ├── HomeView.swift
│   ├── SearchView.swift
│   ├── FavoritesView.swift
│   ├── ProfileView.swift
│   ├── SettingsView.swift           # theme picker + app version list
│   ├── AppTheme.swift               # Auto/Light/Dark theme model
│   ├── ContentView.swift            # sample/scratch view
│   ├── CustomCardView.swift         # reusable component example
│   └── Assets.xcassets/             # colors, app icon
├── SwiftUIUpdatesUnitTests/         # XCTest unit tests
└── SwiftUIUpdatesUITests/
    └── Appium/                      # WebdriverIO + Appium UI tests
        ├── Config/wdio.conf.js
        ├── Helpers/capabilities.js  # iOS caps + tab definitions
        ├── Tests/*.test.js
        ├── Reports/                 # generated HTML reports
        └── package.json
```

## Conventions

- **One view per file**, named after the type it contains. Keep files focused on
  a single responsibility and keep views small; break complex views into
  subviews and extract reusable pieces (see `CustomCardView`).
- **Each tab view** wraps its content in a `NavigationStack` with
  `.navigationTitle` + `.navigationBarTitleDisplayMode(.large)`.
- **Tabs are data-driven** via `MainTabView.TabConfiguration`, including a stable
  `accessibilityIdentifier` (e.g. `tab.settings`). Keep these identifiers in sync
  with `Appium/Helpers/capabilities.js` when tabs change.
- **`// MARK: -`** is used to organize sections; do not add an empty line after
  the MARK.
- **Accessibility identifiers** are required on important UI so Appium can target
  them (e.g. `settings.theme.picker`, `settings.appVersion`). Add them to new
  screens and major components.
- **New source files must be registered in `project.pbxproj`** (this project does
  not use synchronized folders).
- The `AGENTS.md` references an aspirational `Application/Core/Features/Resources`
  folder layout. The current code is flat under `SwiftUIUpdates/`; follow the
  existing flat layout unless explicitly asked to restructure.
