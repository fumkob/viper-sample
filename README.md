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
- **Code Quality**: SwiftLint 0.61.0
- **Code Generation**: SwiftGen 6.6.3
- **Tool Management**: mise

## Setup

### Prerequisites

- Xcode 16+ with iOS 26.0+ SDK
- [mise](https://mise.jdx.dev/) for tool management

### Installation

```bash
# Install mise (if not already installed)
curl https://mise.jdx.dev/install.sh | sh

# Clone repository
git clone <repository-url>
cd viper-sample

# Install development tools
mise install

# Verify installation
swiftlint --version  # Should show 0.61.0
swiftgen --version   # Should show 6.6.3
```

## Development

### Building and Testing

```bash
# Build
xcodebuild -project VIPERSample.xcodeproj -scheme VIPERSample build

# Run tests
xcodebuild test -project VIPERSample.xcodeproj -scheme VIPERSample -destination 'platform=iOS Simulator,name=iPhone 15,OS=latest'
```

### Code Quality

```bash
# Lint code
swiftlint

# Auto-fix linting issues
swiftlint --fix
```

### Code Generation

```bash
# Generate constants from assets, strings, storyboards
swiftgen

# Generate specific resource types
swiftgen run xcassets  # Assets only
swiftgen run strings   # Localized strings only
swiftgen run ib        # Storyboards/XIBs only
```

## VIPER Architecture

Each module follows this structure:

- **View**: UIViewController, user interface
- **Interactor**: Business logic
- **Presenter**: View logic, data formatting
- **Entity**: Data models
- **Router**: Navigation, screen transitions

## Project Structure

```
VIPERSample/
├── VIPERSample/           # Main application source
├── VIPERSampleTests/      # Unit tests
├── VIPERSampleUITests/    # UI tests
├── mise.toml              # Tool version management
├── .swiftlint.yml         # Linting configuration
├── swiftgen.yml           # Code generation configuration
└── README.md / CLAUDE.md  # Documentation
```

## Contributing

1. Ensure all development tools are installed: `mise install`
2. Run linting before committing: `swiftlint`
3. Generate code for new resources: `swiftgen`
4. Write tests for new functionality
5. Follow VIPER architectural patterns

See [CLAUDE.md](CLAUDE.md) for detailed development guidelines and commands.
