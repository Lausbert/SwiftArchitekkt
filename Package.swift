// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SwiftArchitekkt",
    platforms: [
        .macOS(.v11)
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
            dependencies: ["CoreArchitekkt"]
        ),
        .testTarget(
            name: "SwiftArchitekktTests",
            dependencies: ["SwiftArchitekkt"]
        ),
    ]
)
