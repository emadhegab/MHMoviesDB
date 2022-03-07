// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppConfigurations",
    platforms: [
        .iOS(.v14),
        .tvOS(.v10),
        .macOS(.v10_14),
        .watchOS(.v3)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AppConfigurations",
            targets: ["AppConfigurations"]),
    ],
    dependencies: [

    ],
    targets: [

        .target(
            name: "AppConfigurations",
            dependencies: []),
        .testTarget(
            name: "AppConfigurationsTests",
            dependencies: ["AppConfigurations"]),
    ]
)
