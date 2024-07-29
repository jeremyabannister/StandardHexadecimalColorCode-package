// swift-tools-version: 5.10

///
import PackageDescription


///
let package = Package(
    name: "StandardHexadecimalColorCode-package",
    products: [
        .library(
            name: "StandardHexadecimalColorCode-module",
            targets: ["StandardHexadecimalColorCode-module"]
        ),
    ],
    dependencies: [
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/AssertionToolkit",
            "0.1.0" ..< "0.2.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/ColorCode-RGBA-256-package",
            "0.1.0" ..< "0.2.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/RandomlyGeneratable-package",
            "0.1.0" ..< "0.2.0"
        ),
    ],
    targets: [
        
        ///
        .target(
            name: "StandardHexadecimalColorCode-module",
            dependencies: [
                .product(name: "ColorCode-RGBA-256-module", package: "ColorCode-RGBA-256-package"),
            ]
        ),
        
        ///
        .testTarget(
            name: "StandardHexadecimalColorCode-module-tests",
            dependencies: [
                "StandardHexadecimalColorCode-module",
                "AssertionToolkit",
                .product(name: "RandomlyGeneratable-module", package: "RandomlyGeneratable-package"),
            ]
        ),
    ]
)
