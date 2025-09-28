# VIPERSample

A sample iOS project for learning VIPER architecture pattern.

## Overview

This project is designed as sample code for understanding and practicing the VIPER (View, Interactor, Presenter, Entity, Router) architectural pattern in iOS development.

## Tech Stack

- **iOS**: 26.0+
- **Swift**: 6.0
- **Xcode**: 16
- **Architecture**: VIPER
- **Testing**: Swift Testing
- **Code Quality**: SwiftLint

## Development

```bash
# Build
xcodebuild -project VIPERSample.xcodeproj -scheme VIPERSample build

# Run tests
xcodebuild test -project VIPERSample.xcodeproj -scheme VIPERSample -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest'

# Lint code
swiftlint

# Auto-fix linting issues
swiftlint --fix
```

## VIPER Architecture

Each module follows this structure:

- **View**: UIViewController, user interface
- **Interactor**: Business logic
- **Presenter**: View logic, data formatting
- **Entity**: Data models
- **Router**: Navigation, screen transitions

See [CLAUDE.md](CLAUDE.md) for detailed development guidelines.