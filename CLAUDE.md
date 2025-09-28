# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an iOS Swift application following the VIPER (View, Interactor, Presenter, Entity, Router) architectural pattern. The project uses Xcode 16 (Swift 6.0) and targets iOS 26.0+ with support for both iPhone and iPad.

## Build Commands

**Build the app:**
```bash
xcodebuild -project VIPERSample.xcodeproj -scheme VIPERSample -configuration Debug build
```

**Build for release:**
```bash
xcodebuild -project VIPERSample.xcodeproj -scheme VIPERSample -configuration Release build
```

**Clean build:**
```bash
xcodebuild -project VIPERSample.xcodeproj -scheme VIPERSample clean
```

## Testing Commands

**Run unit tests:**
```bash
xcodebuild test -project VIPERSample.xcodeproj -scheme VIPERSample -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest'
```

**Run UI tests:**
```bash
xcodebuild test -project VIPERSample.xcodeproj -scheme VIPERSample -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest' -only-testing:VIPERSampleUITests
```

**Run specific unit test:**
```bash
xcodebuild test -project VIPERSample.xcodeproj -scheme VIPERSample -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest' -only-testing:VIPERSampleTests/VIPERSampleTests/example
```

## Development Tools Setup

This project uses [mise](https://mise.jdx.dev/) for development tool version management. Ensure you have mise installed and run:

```bash
# Install project-specific tool versions (first time setup)
mise install

# Tools will be automatically activated when in project directory
# Verify installation:
swiftlint --version  # Should show 0.61.0
swiftgen --version   # Should show 6.6.3
```

## Linting Commands

**Lint all Swift files:**
```bash
swiftlint
```

**Auto-fix linting issues:**
```bash
swiftlint --fix
```

**Lint specific files:**
```bash
swiftlint lint --path VIPERSample/ViewController.swift
```

**Lint with specific configuration:**
```bash
swiftlint --config .swiftlint.yml
```

**Force use mise version (if needed):**
```bash
mise exec -- swiftlint
```

## Code Generation Commands

**Generate constants from Assets/Strings/Storyboards:**
```bash
swiftgen
```

**Initialize SwiftGen configuration (already done):**
```bash
swiftgen config init
```

**Generate specific resource types:**
```bash
swiftgen run xcassets  # Generate from Assets.xcassets
swiftgen run strings   # Generate from localized strings
swiftgen run ib        # Generate from storyboards/XIBs
```

## Project Structure

**Core Application:**
- `VIPERSample/` - Main application source code
- `AppDelegate.swift` - Application lifecycle management with scene support
- `SceneDelegate.swift` - Scene-based UI lifecycle (iOS 13+)
- `ViewController.swift` - Basic view controller (will be replaced with VIPER modules)
- `Info.plist` - App configuration and permissions

**Testing:**
- `VIPERSampleTests/` - Unit tests using Swift Testing framework
- `VIPERSampleUITests/` - UI automation tests

**Resources:**
- `Assets.xcassets/` - App icons, colors, and image assets
- `Base.lproj/` - Storyboard files and localization base

**Development Tools:**
- `mise.toml` - Tool version management configuration
- `.swiftlint.yml` - SwiftLint rules and configuration
- `swiftgen.yml` - SwiftGen code generation configuration

## VIPER Architecture Guidelines

When implementing VIPER modules, follow this structure:

**Module Organization:**
```
ModuleName/
├── ModuleNameView.swift          # UIViewController conforming to ViewProtocol
├── ModuleNameInteractor.swift    # Business logic implementation
├── ModuleNamePresenter.swift     # View logic and formatting
├── ModuleNameEntity.swift        # Data models
├── ModuleNameRouter.swift        # Navigation logic
└── ModuleNameProtocols.swift     # Protocol definitions
```

**Protocol Definitions:**
- ViewProtocol: Defines view interface for presenter
- InteractorInputProtocol: Defines interactor interface for presenter
- InteractorOutputProtocol: Defines presenter interface for interactor
- PresenterProtocol: Defines presenter interface for view
- RouterProtocol: Defines routing interface for presenter

## Configuration Notes

- **Bundle Identifier:** com.fumkob.VIPERSample
- **Deployment Target:** iOS 26.0
- **Swift Version:** 6.0 with modern concurrency enabled
- **Code Signing:** Automatic
- **Supported Orientations:** Portrait, Landscape Left, Landscape Right (iPhone); All orientations (iPad)
- **Testing Framework:** Swift Testing (not XCTest)

## Development Workflow

1. **Setup Development Environment:**
   - Install mise: `curl https://mise.jdx.dev/install.sh | sh`
   - Install project tools: `mise install`
   - Verify tools: `swiftlint --version && swiftgen --version`

2. **Code Quality Workflow:**
   - Run SwiftLint before committing: `swiftlint`
   - Auto-fix style issues: `swiftlint --fix`
   - Generate resource constants: `swiftgen` (when adding new assets/strings)

3. **VIPER Module Development:**
   - Create VIPER modules in separate directories under `VIPERSample/`
   - Replace the default `ViewController.swift` with VIPER module entry points
   - Use storyboards for basic UI layout, programmatic UI for complex interactions
   - Write unit tests for Interactors and Presenters
   - Write UI tests for complete user flows
   - Follow iOS naming conventions and Swift style guidelines

## Documentation Maintenance

**Important:** When performing any development work on this project, always ensure that documentation files (README.md, CLAUDE.md) are kept up-to-date with any changes made. This includes:

- Adding new modules or components to the project structure
- Updating build or test commands if they change
- Modifying architectural patterns or guidelines
- Adding new dependencies or configuration changes
- Updating workflow processes or conventions

Documentation should accurately reflect the current state of the project at all times.