// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlertScheduler",
    platforms: [
        .iOS(.v8)
    ],
    products: [
        .library(
            name: "AlertScheduler",
            targets: ["AlertScheduler"]),
    ],
    targets: [
        .target(
            name: "AlertScheduler",
            dependencies: []),
        .testTarget(
            name: "AlertSchedulerTests",
            dependencies: ["AlertScheduler"]),
    ]
)
