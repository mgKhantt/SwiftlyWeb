// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftlyWeb",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftlyWeb",
            targets: ["SwiftlyWeb"]
        ),
    ],
    dependencies: [],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SwiftlyWeb",
            dependencies: []
        ),
        .executableTarget(
            name: "SwiftlyWebDemo",
            dependencies: ["SwiftlyWeb"]
        ),
        .testTarget(
            name: "SwiftlyWebTests",
            dependencies: ["SwiftlyWeb"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
