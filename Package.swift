// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SwiftArchitekkt",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "SwiftArchitekkt",
            targets: ["SwiftArchitekkt"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/Lausbert/CoreArchitekkt",
            .upToNextMajor(from: Version(0, 0, 0)
            )
        )
    ],
    targets: [
        .target(
            name: "SwiftArchitekkt",
            dependencies: ["CoreArchitekkt"],
            exclude: ["Resources"]
        ),
        .testTarget(
            name: "SwiftArchitekktTests",
            dependencies: ["SwiftArchitekkt"],
            exclude: ["Resources"]
        ),
    ]
)
