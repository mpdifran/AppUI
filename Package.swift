// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppUI",
    platforms: [
        .macOS(.v14),
        .iOS(.v16),
        .tvOS(.v16),
    ],
    products: [
        .library(
            name: "AppUI",
            targets: ["AppUI"]),
    ],
    targets: [
        .target(
            name: "AppUI"),
        .testTarget(
            name: "AppUITests",
            dependencies: ["AppUI"]),
    ]
)
