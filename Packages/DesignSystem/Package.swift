// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [
        .iOS(.v14),
        .tvOS(.v10),
        .macOS(.v10_14),
        .watchOS(.v3)
    ],
    products: [

        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]),
    ],
    dependencies: [

    ],
    targets: [

        .target(
            name: "DesignSystem",
            dependencies: [],
            resources: [.process("Resources/Fonts/MorlRounded-Bold.ttf"),
                        .process("Resources/Fonts/MorlRounded-Light.ttf"),
                        .process("Resources/Fonts/MorlRounded-Medium.ttf"),
                        .process("Resources/Fonts/MorlRounded-Regular.ttf")]),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: ["DesignSystem"]),
    ]
)
