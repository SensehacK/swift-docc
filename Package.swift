// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swifty-docc",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "swifty-docc",
            targets: ["swifty-docc"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "swifty-docc"),
        .testTarget(
            name: "swifty-doccTests",
            dependencies: ["swifty-docc"]),
    ]
)
