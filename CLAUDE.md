# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an iOS Swift application following the VIPER (View, Interactor, Presenter, Entity, Router) architectural pattern. The project uses Xcode 16 (Swift 5.0) and targets iOS 26.0+ with support for both iPhone and iPad.

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
- **Swift Version:** 5.0 with modern concurrency enabled
- **Code Signing:** Automatic
- **Supported Orientations:** Portrait, Landscape Left, Landscape Right (iPhone); All orientations (iPad)
- **Testing Framework:** Swift Testing (not XCTest)

## Development Workflow

1. Create VIPER modules in separate directories under `VIPERSample/`
2. Replace the default `ViewController.swift` with VIPER module entry points
3. Use storyboards for basic UI layout, programmatic UI for complex interactions
4. Write unit tests for Interactors and Presenters
5. Write UI tests for complete user flows
6. Follow iOS naming conventions and Swift style guidelines