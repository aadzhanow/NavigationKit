// swift-tools-version:6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NavigationKit",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "NavigationKit",
            targets: ["NavigationKit"]),
    ],
    targets: [
        .target(
            name: "NavigationKit")
    ]
)
