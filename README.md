# SwiftlyWeb

A Swift DSL for building HTML pages with pure Swift syntax.

## Requirements
- macOS 13+
- Swift 6.3+

## Installation

### Swift Package Manager

In your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/mgKhantt/SwiftlyWeb.git", from: "1.0.0")
],
targets: [
    .executableTarget(
        name: "YourApp",
        dependencies: [
            .product(name: "SwiftlyWeb", package: "SwiftlyWeb")
        ]
    )
]
```

## Usage

```swift
import SwiftlyWeb

HTMLPage {
    H1("Hello World").color("steelblue").fontSize(40)
    P("Built with SwiftlyWeb.")
}
```

## License
MIT