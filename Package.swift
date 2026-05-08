// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "Apparition",
    platforms: [
        .iOS(.v16),
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "Apparition",
            targets: ["Apparition"]
        ),
    ],
    targets: [
        .target(
            name: "Apparition",
            dependencies: [],
            path: "Sources/Apparition"
        ),
        .testTarget(
            name: "ApparitionTests",
            dependencies: ["Apparition"],
            path: "Tests/ApparitionTests"
        ),
    ]
)
