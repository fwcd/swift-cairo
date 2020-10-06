// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Cairo",
    products: [
        .library(
            name: "Cairo",
            targets: ["Cairo"]),
    ],
    targets: [
        .target(
            name: "Cairo",
            dependencies: [
                "SwiftCairoCCairo",
                "SwiftCairoCFontConfig",
                "SwiftCairoCFreeType"
            ]
        ),
        .testTarget(
            name: "CairoTests",
            dependencies: [
                "Cairo"
            ]
        ),
        .systemLibrary(
            name: "SwiftCairoCCairo",
            pkgConfig: "cairo",
            providers: [
                .brew(["cairo"]),
                .apt(["libcairo2-dev"])
            ]),
        .systemLibrary(
            name: "SwiftCairoCFontConfig",
            pkgConfig: "fontconfig",
            providers: [
                .brew(["fontconfig"]),
                .apt(["libfontconfig-dev"])
            ]),
        .systemLibrary(
            name: "SwiftCairoCFreeType",
            pkgConfig: "freetype",
            providers: [
                .brew(["freetype2"]),
                .apt(["libfreetype6-dev"])
            ])
    ],
    swiftLanguageVersions: [.v5]
)
