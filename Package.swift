// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SNJShop",
    platforms: [
      .macOS(.v15),
    ],
    products: [
        .library(
            name: "SNJShop",
            type: .dynamic,
            targets: ["SNJShop"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-java.git", branch: "main")
    ],
    targets: [
        .target(
            name: "SNJShop",
            dependencies: [
                .product(name: "SwiftJava", package: "swift-java"),
                .product(name: "SwiftRuntimeFunctions", package: "swift-java"),
                .target(name: "PaperAPI"),
            ]
        ),
        .target(
            name: "PaperAPI",
            dependencies: [
                .product(name: "SwiftJava", package: "swift-java"),
            ],
            exclude: ["swift-java.config"]
        ),
        .testTarget(
            name: "SNJShopTests",
            dependencies: ["SNJShop"]
        ),
    ]
)
