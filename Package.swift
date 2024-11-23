// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "StandardHexadecimalColorCode-package",
    products: [
        .library(
            name: "StandardHexadecimalColorCode-module",
            targets: ["StandardHexadecimalColorCode-module"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/jeremyabannister/AssertionToolkit",
            .upToNextMinor(from: "0.1.3")
        ),
        .package(
            url: "https://github.com/jeremyabannister/ColorCode-RGBA-256-package",
            .upToNextMinor(from: "0.1.2")
        ),
    ],
    targets: [
        .target(
            name: "StandardHexadecimalColorCode-module",
            dependencies: [
                .product(name: "ColorCode-RGBA-256-module", package: "ColorCode-RGBA-256-package"),
            ]
        ),
        .testTarget(
            name: "StandardHexadecimalColorCode-module-tests",
            dependencies: [
                "StandardHexadecimalColorCode-module",
                "AssertionToolkit",
            ]
        ),
    ]
)
