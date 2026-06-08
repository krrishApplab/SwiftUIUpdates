# Product

SwiftUIUpdates is a native iOS application built with SwiftUI. It serves as a
sandbox for exploring modern SwiftUI APIs and patterns (NavigationStack, glass
effects, Observation, etc.).

## Structure at a glance

The app is a tab-based experience with five primary sections, each backed by its
own SwiftUI view:

- Home
- Search
- Favorites
- Profile
- Settings

Navigation is driven by `MainTabView`, and each tab hosts a `NavigationStack`
with a large navigation title. The app uses a green accent/tint throughout.

## Conventions that matter to users

- Supports both Light and Dark mode (Settings exposes an Auto/Light/Dark theme
  selector persisted via AppStorage).
- Built for the latest stable Swift and SwiftUI; prefers modern APIs over
  deprecated ones.
- UI elements expose accessibility identifiers so they can be driven by the
  Appium UI test suite.
