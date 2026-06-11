// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftlyWeb",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftlyWeb",
            targets: ["SwiftlyWeb"]
        )
    ],
    targets: [
        .target(
            name: "SwiftlyWeb",
            dependencies: [],
            swiftSettings: [
                .define("canImport")
            ]
        ),
        .testTarget(
            name: "SwiftlyWebTests",
            dependencies: ["SwiftlyWeb"]
        )
    ],
    swiftLanguageModes: [.v6]
)
